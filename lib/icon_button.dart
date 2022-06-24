import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final Function()? onPressed;
  final IconData? iconData;
  const CustomIconButton(
      {Key? key, this.color = Colors.red, this.iconData, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: CircleBorder(),
        primary: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconData,
        ),
      ),
    );
  }
}
