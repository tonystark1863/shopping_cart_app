import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/components/cart/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {

  final Map<String,dynamic> product;


  const ProductDetailsPage({
    super.key,
    required this.product,
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0; 

  final fontStyle =const  TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              );


  void onTap(){
    if(selectedSize != 0 ){
    Provider.of<CartProvider>(context,listen: false)
    .addProduct(
      {
    'id' :widget.product['id'],
    'title' :widget.product['title'],
    'price' : widget.product['price'],
    'size' :selectedSize,
    'company' :widget.product['company'],
    'imageUrl' :widget.product['imageUrl'],
    },
    );
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added to Cart")));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select size!!")));
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Details"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              widget.product['title'].toString(),
              style: fontStyle
            ),
        
            const Spacer(),
            Image.asset(
              widget.product['imageUrl'].toString(),
              height: 165,
            ),
            const Spacer(),


            Container(
              height: 240,
              decoration: const  BoxDecoration(
                color:  Color.fromARGB(255, 219, 217, 217),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text(
                    'Rs .${widget.product['price']}',
                    style: fontStyle,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product['sizes'].length ,
                      itemBuilder: (context,index){
                        final size = widget.product['sizes'][index];
                        return  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              backgroundColor: (selectedSize == size) ? Theme.of(context).colorScheme.primary :  Colors.white54,
                              label: Text(
                                '$size',
                                style:const TextStyle(fontWeight: FontWeight.bold),
                                )
                              ),
                          ),
                        );
                      }
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton.icon(
    

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        fixedSize:const Size(250,45),
                        ),
                        icon : const Icon(Icons.shopping_cart_outlined,
                        color: Colors.black
                        ),
                    
                      onPressed:onTap,
                      label:  const Text("Add to Cart",
                       style:  TextStyle(
                        fontWeight:FontWeight.bold,
                        color: Colors.black
                        )
                        ),
                      ),
                  )

                ],
                )
              ,
            )
        
          ],
        ),
      ),
    );
  }
}