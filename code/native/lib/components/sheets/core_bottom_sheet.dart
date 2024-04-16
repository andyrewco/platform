import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';

Future<dynamic> openCoreBottomSheet(
  BuildContext context,
  String route,
  Widget page,
) {
  return showModalBottomSheet(
    context: context,
    barrierLabel: route,
    useSafeArea: true,
    isDismissible: true,
    enableDrag: true,
    isScrollControlled: true,
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    builder: (context) {
      return CoreBottomSheet(
        page: page,
      );
    },
  );
}

class CoreBottomSheet extends StatelessWidget {
  const CoreBottomSheet({
    Key? key,
    required this.page,
  }) : super(key: key);

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ClipSmoothRect(
      radius: SmoothBorderRadius(
        cornerRadius: 32,
        cornerSmoothing: 1,
      ),
      child: page,
    );
  }
}
