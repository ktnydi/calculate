import 'package:flutter/material.dart';

class FigureButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const FigureButton({super.key, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).textTheme.bodyMedium!.color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Colors.white,
        textStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
