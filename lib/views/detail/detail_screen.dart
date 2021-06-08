import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_bloc/models/product.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detil'),
      ),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: args.image,
            width: MediaQuery.of(context).size.width,
            height: 160,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ayam Bakar Utuh Khas Dapoer Mama'),
                      Text('Rp 20.000'),
                    ],
                  ),
                  Spacer(),
                  Divider(),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to Basket'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
