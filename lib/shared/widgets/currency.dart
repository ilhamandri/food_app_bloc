import 'package:flutter/material.dart';
import 'package:food_app_bloc/models/product.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:intl/intl.dart';

class Currency extends StatelessWidget {
  final int price;
  final TextStyle style;

  Currency({this.price, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ').format(price),
      style: style,
    );
  }
}
