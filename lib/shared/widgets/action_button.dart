import 'package:flutter/material.dart';
import 'package:food_app_bloc/shared/palette.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color color;
  ActionButton({@required this.onPressed, @required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color != null ? color : Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Text(title),
      ),
    );
  }
}
