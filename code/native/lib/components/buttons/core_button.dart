import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:local/theme/color.dart';

class CoreButton extends StatelessWidget {
  const CoreButton({
    Key? key,
    required this.text,
    required this.click,
    this.icon,
    this.color,
    this.textColor,
  }) : super(key: key);

  final String text;
  final Color? color;
  final Function click;
  final Color? textColor;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        click();
      },
      child: Container(
        decoration: BoxDecoration(
          color: color ?? kColorDeepBlood,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: textColor ?? kColorSand,
              ),
        ),
      ),
    );
  }
}
