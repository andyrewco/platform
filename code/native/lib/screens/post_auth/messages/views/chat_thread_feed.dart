import 'package:flutter/material.dart';
import 'package:local/screens/post_auth/messages/views/chat_thread.dart';

class ChatThreadFeed extends StatefulWidget {
  const ChatThreadFeed({Key? key}) : super(key: key);

  @override
  State<ChatThreadFeed> createState() => _ChatThreadFeedState();
}

class _ChatThreadFeedState extends State<ChatThreadFeed> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        ChatThread(),
        Divider(),
        ChatThread(),
        Divider(),
        ChatThread(),
        Divider(),
        ChatThread(),
      ],
    );
  }
}
