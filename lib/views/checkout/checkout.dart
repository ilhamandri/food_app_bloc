import 'package:flutter/material.dart';
import 'package:food_app_bloc/shared/palette.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:food_app_bloc/shared/widgets/action_button.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: StyleConstant.bold14,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text('Checkout item list'),
          ),
          Container(
            child: ActionButton(
              onPressed: () {},
              title: 'Checkout',
              color: Palette.green,
            ),
          )
        ],
      ),
    );
  }
}
