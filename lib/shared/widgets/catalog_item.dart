import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_bloc/models/product.dart';

class CatalogItem extends StatelessWidget {
  final Product product;
  CatalogItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: product.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Icon(Icons.error),
            width: double.infinity,
            height: 167,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(product.title),
        SizedBox(
          height: 10,
        ),
        Text(
          product.price.toString(),
        ),
      ],
    );
  }
}
