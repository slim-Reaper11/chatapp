import 'dart:ffi';

import 'package:chatapp/core/widgets/glass_button.dart';
import 'package:chatapp/core/widgets/glass_container.dart';
import 'package:chatapp/features/conversations/presentation/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme.primary;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        // animateColor: false,

        // backgroundColor: Colors.transparent,
        // elevation: 0,
        // surfaceTintColor: Colors.transparent,
        forceMaterialTransparency: true,

        // scrolledUnderElevation: 0,
        title: Glassbutton(
          shadow: true,
          child: Row(
            children: [
              Icon(Icons.account_circle, size: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'status',
                    style: TextStyle(
                      color: const Color.fromARGB(192, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, size: 30)),
        ],
        actionsPadding: EdgeInsets.only(right: 2),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: GlassContainer(
          height: 45,
          shadow: true,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.emoji_emotions),
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                    colorScheme.a.toInt() + 13,
                    colorScheme.r.toInt(),
                    colorScheme.g.toInt(),
                    colorScheme.b.toInt(),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical(y: -0.7),
                  decoration: InputDecoration(),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                    colorScheme.a.toInt() + 13,
                    colorScheme.r.toInt(),
                    colorScheme.g.toInt(),
                    colorScheme.b.toInt(),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.mic),
                style: IconButton.styleFrom(
                  backgroundColor: Color.fromARGB(
                    colorScheme.a.toInt() + 13,
                    colorScheme.r.toInt(),
                    colorScheme.g.toInt(),
                    colorScheme.b.toInt(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 219, 208, 204),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 56),
              Text("Show messages here", style: textTheme.displaySmall),
            ],
          ),
        ),
      ),
    );
  }
}
