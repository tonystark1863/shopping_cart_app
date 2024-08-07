import 'package:flutter/material.dart';
import 'package:shopping_app/components/global_variables.dart';
import 'package:shopping_app/components/productpage/product_card.dart';
import 'package:shopping_app/components/productpage/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  final List<String> filters = const ['All','Adidas','Nike','Bata'];

  late String selectedFilter;

  
   


  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }


  @override
  Widget build(BuildContext context) {

    const  border =  OutlineInputBorder(
                        borderSide:   BorderSide(
                          color:  Color.fromRGBO(225, 225, 225, 1),
                        ),
                        borderRadius:  BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                      );

                      
    return  SafeArea(
      child: Scaffold(
            body: Column(
              children: [
        
                //Header
                Row(
                  children: [
                    Padding(
                      padding: const  EdgeInsets.all(20.0),
                      child:  Text(
                        " Shoes\n Collection",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon:  Icon(Icons.search),
                          border: border,
                          enabledBorder: border,
                          focusedBorder: border,
        
                        ),
                      )
                      ),
                  ],
                ),
                
                //body
      
                //filter bar 
                SizedBox(
                  height: 120,
      
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (context, index){
                      final filter = filters[index];
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Chip(
                              backgroundColor : selectedFilter == filter ? Theme.of(context).colorScheme.primary :  const Color.fromARGB(255, 219, 217, 217),
                              side: const  BorderSide(
                                color:  Color.fromARGB(255, 219, 217, 217),
                                ),
                              padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              label: Text(filter,style:const TextStyle(fontWeight: FontWeight.bold),),
                              labelStyle:const  TextStyle(
                                fontSize: 15,
                              ),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                              
                            ),
                          ),
                        );
                      },
                  ),
                ),
      
                //content

                Expanded(
                  child: LayoutBuilder(
                    builder: (context,constraints){
                      if(constraints.maxWidth>1080){
                        return   GridView.builder(
                          itemCount:products.length ,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2
                      ), 
                      itemBuilder: (context,index){
                        final product = products[index];
                        return  GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context){
                                  return ProductDetailsPage(product: product);
                            }));
                          },
                          child: ProductCard(
                            title : product['title'] as String,
                            price : product['price'] as double,
                            image: product['imageUrl'] as String,
                            ),
                        );
                      },
                  
                      );
                      }
                      else{
                      return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context,index){
                        final product = products[index];
                        return  GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context){
                                  return ProductDetailsPage(product: product);
                            }));
                          },
                          child: ProductCard(
                            title : product['title'] as String,
                            price : product['price'] as double,
                            image: product['imageUrl'] as String,
                            ),
                        );
                      },
                  );
                  
                      }
                    }
                    ),
                ),


        

        
              ],
            ),
          ),
    );
  }
}