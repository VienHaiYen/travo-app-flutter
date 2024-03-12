import 'package:flutter/material.dart';

class _Message extends StatelessWidget {
  const _Message(
      {super.key,
        required this.message,
        required this.color,
        required this.borderRadius,
        required this.textColor});

  final String message;
  final Color color;
  final Color textColor;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Text(message,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: textColor,
          )),
    );
  }
}

class SelfMessage extends StatelessWidget {
  const SelfMessage({super.key, required this.message});

  final double cornerRadius = 19;
  final String message;

  _Message _messageWidget(BuildContext context) {
    final theme = Theme.of(context);

    return _Message(
      message: message,
      color: theme.colorScheme.primary,
      textColor: const Color(0xffffffff),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomLeft: Radius.circular(cornerRadius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.bookmark_add_outlined,
          size: 20,
          color: Color(0xffBBBBBB),
        ),
        const SizedBox(width: 6),
        _messageWidget(context),
      ],
    );
  }
}

class OtherMessage extends StatelessWidget {
  const OtherMessage({super.key, required this.message});

  final double cornerRadius = 19;
  final String message;

  _Message _messageWidget() {
    return _Message(
      message: message,
      color: const Color(0xfff5f5f5),
      textColor: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(cornerRadius),
        topRight: Radius.circular(cornerRadius),
        bottomRight: Radius.circular(cornerRadius),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _messageWidget(),
        const SizedBox(width: 6),
        const Column(
          children: [
            Icon(
              Icons.copy_outlined,
              size: 20,
              color: Color(0xffBBBBBB),
            ),
            SizedBox(height: 14),
            Icon(
              Icons.share_outlined,
              size: 20,
              color: Color(0xffBBBBBB),
            ),
          ],
        )
      ],
    );
  }
}