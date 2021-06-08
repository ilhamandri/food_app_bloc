import 'package:flutter/material.dart';
import 'package:food_app_bloc/shared/palette.dart';

class AddRemoveButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback action;

  AddRemoveButton({this.action, this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        border: Border.all(color: Palette.border),
      ),
      child: InkWell(
        onTap: action,
        child: Icon(
          iconData,
          color: Palette.green,
        ),
      ),
    );
  }
}
