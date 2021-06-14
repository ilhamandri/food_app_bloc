import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:food_app_bloc/extensions/string_extension.dart';
import 'package:food_app_bloc/shared/palette.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:food_app_bloc/shared/widgets/currency.dart';

class CatalogItem extends StatelessWidget {
  final Product product;
  CatalogItem({this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pushNamed(
            '/detail',
            arguments: product,
          ),
          child: Stack(
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
              _buildPriceGradient(),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          product.title.capitalizeFirstLetter(),
          overflow: TextOverflow.ellipsis,
          style: StyleConstant.bold14,
        ),
      ],
    );
  }

  Widget _buildIcon() {
    return Positioned(
      right: 5,
      top: 5,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _buildPriceGradient() {
    return Positioned(
      bottom: 0,
      child: Container(
        // width: 100,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
          gradient: LinearGradient(colors: [Palette.gradient1, Palette.gradient2]),
        ),
        child: Currency(
          price: product.price,
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }
}
