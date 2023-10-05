import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  const ChatBubble({super.key, required this.message, required this.isSender});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSender ? Colors.blue[400] : Colors.white,
      ),
      child: Text(
        message,
        style: TextStyle(
            fontSize: 16, color: isSender ? Colors.white : Colors.black),
      ),
    );
  }
}
