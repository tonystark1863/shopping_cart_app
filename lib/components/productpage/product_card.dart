import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    });
    
  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: const EdgeInsets.all(20),
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color.fromARGB(255, 219, 217, 217),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title ,
             style: Theme.of(context).textTheme.titleMedium,
             ),
            const SizedBox(height: 5),
        
            Text('Rs $price',
            style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
            Center(
              child: Image.asset(
                image ,
                height:150
              ),
            ),
        
          ],
        ),
      ),

    );
  }
}