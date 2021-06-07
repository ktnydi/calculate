import 'package:flutter/material.dart';

class FigureButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  FigureButton({required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: child,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Colors.white,
        primary: Theme.of(context).textTheme.bodyText2!.color,
        textStyle: Theme.of(context).textTheme.headline5,
      ),
      onPressed: onPressed,
    );
  }
}
