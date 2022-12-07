// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  late String sender;
  late String text;
  late bool isMe;
  MessageBubble(
      {Key? key, required this.sender, required this.text, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Material(
            elevation: 5.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            borderRadius: isMe
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  )
                : const BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
