import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:food_app_bloc/extensions/string_extension.dart';
import 'package:food_app_bloc/shared/palette.dart';

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
          _buildItemImage(args),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(args.title.capitalizeFirstLetter()),
                      Text('Rp ' + args.price.toString()),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(args.description),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [],
                  ),
                  Spacer(),
                  Divider(
                    height: 2,
                    color: Palette.divider,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Palette.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text('Add to Basket'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemImage(Product product) {
    return CachedNetworkImage(
      imageUrl: product.image,
      width: double.infinity,
      height: 160,
      fit: BoxFit.cover,
    );
  }
}
