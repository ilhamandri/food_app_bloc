import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app_bloc/blocs/cubit/counter_item.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:food_app_bloc/extensions/string_extension.dart';
import 'package:food_app_bloc/shared/palette.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:food_app_bloc/shared/widgets/action_button.dart';
import 'package:food_app_bloc/shared/widgets/add_remove_button.dart';
import 'package:food_app_bloc/shared/widgets/currency.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Product;

    return BlocProvider(
      create: (context) => CounterItemCubit(product: args),
      child: Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    product.title.capitalizeFirstLetter(),
                    style: StyleConstant.normal16,
                  ),
                ),
                Currency(
                  price: product.price,
                  style: TextStyle(fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              product.description,
              style: StyleConstant.light16,
            ),
            SizedBox(
              height: 40,
            ),
            _buildAddRemoveWidget(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Divider(
                height: 2,
                color: Palette.divider,
              ),
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
    return BlocBuilder<CounterItemCubit, int>(
      builder: (context, state) {
        return Row(
          children: [
            AddRemoveButton(
              action: () => context.read<CounterItemCubit>().decrementItem(),
              iconData: Icons.remove,
            ),
            SizedBox(
              width: 20,
            ),
            Text('$state'),
            SizedBox(
              width: 20,
            ),
            AddRemoveButton(
              action: () => context.read<CounterItemCubit>().incrementItem(),
              iconData: Icons.add,
            ),
          ],
        );
      },
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
