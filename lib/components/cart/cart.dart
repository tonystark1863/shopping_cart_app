import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/cart/cart_provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    // or (alternative)
    final cart = context.watch<CartProvider>().cart;
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(
          "Cart",
          style: Theme.of(context).textTheme.titleMedium,
          ),
      ),
      body: ListView.builder(
        itemCount:  cart.length,
        itemBuilder: (context,index){
          final Map<String,dynamic> product = cart[index];
          return ListTile(

            leading: CircleAvatar(
              backgroundImage: AssetImage(
                product['imageUrl'],
              ),
              radius: 30,
            ),

            title: Text(
              product['title']
            ),

            subtitle: Text('Size : ${product['size']}'),

            trailing: IconButton(
              onPressed: (){
                  showDialog(
                    barrierDismissible: true,
                    context: context,
                   builder: (context){
                    return  AlertDialog(
                      title: Text("Delete Product?",style: Theme.of(context).textTheme.titleMedium),
                      content: const  Text("Are you sure you want to remove the product from your cart?"),
                      actions:  [
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();

                          }, 
                          child: const Text("No" ,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),)
                          ),
                          TextButton(
                            onPressed: (){
                              // Provider.of<CartProvider>(context,listen: false).removeProduct(product);
                              // or 
                              context.read<CartProvider>().removeProduct(product);
                              Navigator.of(context).pop();
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Deleted from cart")));

                            },
                             child: const Text("Yes" , style: TextStyle(fontWeight: FontWeight.bold ,color: Colors.red),)
                             ),

                      ],
                    );
                   },
                   );
              },
              icon: const Icon(Icons.delete ,color: Colors.red,),
            ),
          );
        }
        )
    );
  }
}