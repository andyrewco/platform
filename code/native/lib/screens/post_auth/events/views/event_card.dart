import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local/repos/data/models/event.dart';
import 'package:local/screens/post_auth/event/event_screen.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EventCard extends StatefulWidget {
  const EventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          opacity = 0.6;
        });
      },
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                EventScreen(eventID: widget.event.eventID),
          ),
        );
      },
      onTapUp: (details) {
        setState(() {
          opacity = 1;
        });
      },
      onTapCancel: () {
        setState(() {
          opacity = 1;
        });
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: opacity,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: TW3Colors.gray.shade700,
            border: Border.all(
              color: TW3Colors.gray.shade500.withOpacity(.25),
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEventCardHeader(context, widget.event),
              const SizedBox(
                height: 8,
              ),
              _buildEventCardContent(context, widget.event),
              const SizedBox(
                height: 8,
              ),
              _buildEventCardFooter(context, widget.event),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildEventCardHeader(BuildContext context, Event event) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // name
      Text(
        event.name,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        event.place.name,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontStyle: FontStyle.italic,
        ),
      ),
    ],
  );
}

Widget _buildEventCardContent(BuildContext context, Event event) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        event.description,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ],
  );
}

Widget _buildEventCardFooter(BuildContext context, Event event) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "#Rock-Climbing",
        style: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 12,
            color: TW3Colors.gray.shade500,
          ),
          children: [
            TextSpan(text: DateFormat.yMMMd().format(event.startDate)),
            const TextSpan(
              text: " @ ",
            ),
            TextSpan(text: event.startTime),
          ],
        ),
      ),
    ],
  );
}
