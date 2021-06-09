import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:food_app_bloc/extensions/string_extension.dart';
import 'package:food_app_bloc/shared/palette.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:food_app_bloc/shared/widgets/action_button.dart';
import 'package:food_app_bloc/shared/widgets/add_remove_button.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Detil',
          style: StyleConstant.bold14,
        ),
      ),
      body: Column(
        children: [
          _buildItemImage(args),
          _buildDescriptionAndButton(args),
        ],
      ),
    );
  }

  Widget _buildDescriptionAndButton(Product product) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.title.capitalizeFirstLetter()),
                Text('Rp ' + product.price.toString()),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(product.description),
            SizedBox(
              height: 40,
            ),
            _buildAddRemoveWidget(),
            Spacer(),
            Divider(
              height: 2,
              color: Palette.divider,
            ),
            Container(
              width: double.infinity,
              child: ActionButton(
                onPressed: () {},
                title: 'Add to Basket',
                color: Palette.green,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddRemoveWidget() {
    return Row(
      children: [
        AddRemoveButton(
          action: () {},
          iconData: Icons.add,
        ),
        SizedBox(
          width: 20,
        ),
        Text('2'),
        SizedBox(
          width: 20,
        ),
        AddRemoveButton(
          action: () {},
          iconData: Icons.remove,
        ),
      ],
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
