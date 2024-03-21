import 'package:app_cyclone/daily_exercise/w2-d1/widget/message.dart';
import 'package:flutter/material.dart';

class MessageRow extends StatelessWidget {
  const MessageRow({super.key, required this.message, required this.isSelf});

  final String message;
  final bool isSelf;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        isSelf ? SelfMessage(message: message) : OtherMessage(message: message),
      ],
    );
  }
}
