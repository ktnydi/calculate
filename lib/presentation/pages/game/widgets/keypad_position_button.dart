import 'package:calculate/enums/keyboard_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeypadPositionButton extends ConsumerWidget {
  const KeypadPositionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardLocation = ref.watch(keyboardLocationProvider);
    final keyboardLocationNotifier =
        ref.watch(keyboardLocationProvider.notifier);

    return Row(
      children: [
        if (keyboardLocation == KeyboardLocation.right)
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              keyboardLocationNotifier.change(KeyboardLocation.left);
            },
            icon: const Icon(Icons.keyboard_double_arrow_left),
          ),
        const Spacer(),
        if (keyboardLocation == KeyboardLocation.left)
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              keyboardLocationNotifier.change(KeyboardLocation.right);
            },
            icon: const Icon(Icons.keyboard_double_arrow_right),
          ),
      ],
    );
  }
}
