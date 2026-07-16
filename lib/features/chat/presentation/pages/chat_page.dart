import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 204, 219, 219)),
      backgroundColor: const Color.fromARGB(255, 204, 219, 219),
      body: Center(
        child: Text("Show messages here", style: textTheme.displaySmall),
      ),
    );
  }
}
