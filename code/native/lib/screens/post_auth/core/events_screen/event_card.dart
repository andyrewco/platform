import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:local/models/event.dart';
import 'package:local/screens/post_auth/event/event_screen.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EventCard extends HookWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final opacity = useState(1.0);

    return GestureDetector(
      onTapDown: (details) {
        opacity.value = 0.6;
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EventScreen(eventID: event.eventID),
          ),
        );
      },
      onTapUp: (details) {
        opacity.value = 1;
      },
      onTapCancel: () {
        opacity.value = 1;
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: opacity.value,
        child: Container(
          decoration: BoxDecoration(
            color: TW3Colors.gray.shade700,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          height: 100,
        ),
      ),
    );
  }
}
