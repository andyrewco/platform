import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.size,
    required this.tap,
  });

  final HeroIcons icon;
  final Function tap;
  final double size;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          selected = true;
        });
      },
      onTap: () {
        widget.tap();
      },
      onTapUp: (details) {
        setState(() {
          selected = false;
        });
      },
      onTapCancel: () {
        setState(() {
          selected = false;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: selected ? TW3Colors.gray.shade600 : Colors.transparent,
        ),
        child: HeroIcon(
          widget.icon,
          color: TWColors.gray.shade400,
          size: widget.size,
          style: selected ? HeroIconStyle.solid : HeroIconStyle.outline,
        ),
      ),
    );
  }
}
