import 'package:calculate/extensions/context.dart';
import 'package:flutter/material.dart';

class SelectableListTile<T> extends StatelessWidget {
  const SelectableListTile({
    Key? key,
    required this.title,
    this.subtitle,
    required this.groupValue,
    required this.value,
    required this.onTap,
  }) : super(key: key);

  final Widget title;
  final Widget? subtitle;
  final T groupValue;
  final T value;
  final void Function(T value) onTap;

  bool get selected => groupValue == value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(value);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedDefaultTextStyle(
                    style: context.textTheme.titleMedium!,
                    duration: kThemeChangeDuration,
                    child: title,
                  ),
                  if (subtitle != null)
                    AnimatedDefaultTextStyle(
                      style: context.textTheme.bodyMedium!.copyWith(
                        color: context.textTheme.bodySmall!.color,
                      ),
                      duration: kThemeChangeDuration,
                      child: subtitle!,
                    ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Icon(
              Icons.check,
              color:
                  selected ? context.colorScheme.primary : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
