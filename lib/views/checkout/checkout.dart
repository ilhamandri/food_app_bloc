import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_app_bloc/shared/palette.dart';
import 'package:food_app_bloc/shared/style_constant.dart';
import 'package:food_app_bloc/shared/widgets/action_button.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Checkout', style: StyleConstant.bold14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Expanded(
            //   child:
            // ),
            _buildCheckoutItem(),
            Divider(
              height: 2,
              color: Palette.divider,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // width: double.infinity,
              child: ActionButton(
                onPressed: () {},
                title: 'Checkout',
                color: Palette.green,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCheckoutItem() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Palette.border)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
                height: 80,
                width: 80,
                fit: BoxFit.cover,
                imageUrl:
                    'https://imgcdnblog.carbay.com/bikeBlog/wp-content/uploads/2017/09/04101912/Honda-CB150R-Exmotion-01.jpg'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 200, child: Text('Ayam Bakar Utuh Khas Dapoer Mama')),
                SizedBox(
                  height: 20,
                ),
                Text('Rp 20.000')
              ],
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
