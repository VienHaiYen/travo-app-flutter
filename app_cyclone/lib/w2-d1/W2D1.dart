import 'package:app_cyclone/w2-d1/widget/message_row.dart';
import 'package:app_cyclone/w2-d1/widget/my_app_bar.dart';
import 'package:flutter/material.dart';

class W2D1 extends StatelessWidget {
  const W2D1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Chatbot AI", showBackButton: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const MessageRow(
                      message: "Hello, how can I help you?",
                      isSelf: false,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const MessageRow(
                      message: "I need help with my account",
                      isSelf: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const MessageRow(
                      message: "Sure, what do you need help with?",
                      isSelf: false,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    child: const MessageRow(
                      message: "I need to reset my password",
                      isSelf: true,
                    ),
                  ),
                  Container(
                    child: const MessageRow(
                      message:
                          "I can help you with that. Please provide me with your email address",
                      isSelf: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
