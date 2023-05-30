import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:tailwind_colors/tailwind_colors.dart';
import 'package:flutter/services.dart';

class CustomBottomAppBarItem extends StatefulWidget {
  const CustomBottomAppBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.index,
    required this.currentIndex,
    required this.onTap,
    this.hasBadge = false,
  });

  final HeroIcons icon;
  final String label;
  final Color color;
  final int index;
  final int currentIndex;
  final Function onTap;
  final bool hasBadge;

  @override
  State<CustomBottomAppBarItem> createState() => _CustomBottomAppBarItemState();
}

class _CustomBottomAppBarItemState extends State<CustomBottomAppBarItem> {
  bool active = false;

  @override
  Widget build(BuildContext context) {
    active = widget.currentIndex == widget.index;

    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          widget.onTap(widget.index);
          HapticFeedback.lightImpact();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // color: active ? TW3Colors.gray.shade700 : Colors.transparent,
          ),
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              widget.hasBadge
                  ? Badge(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: HeroIcon(
                        widget.icon,
                        color: active ? widget.color : TW3Colors.gray.shade500,
                        size: active ? 28 : 22,
                        style: active
                            ? HeroIconStyle.solid
                            : HeroIconStyle.outline,
                      ),
                    )
                  : HeroIcon(
                      widget.icon,
                      color: active ? widget.color : TW3Colors.gray.shade500,
                      size: active ? 28 : 22,
                      style:
                          active ? HeroIconStyle.solid : HeroIconStyle.outline,
                    ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: active ? widget.color : TW3Colors.gray.shade500,
                  fontSize: active ? 13 : 10,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
