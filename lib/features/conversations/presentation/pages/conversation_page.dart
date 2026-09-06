import 'package:chatapp/features/conversations/presentation/widgets/conversation_item.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatelessWidget {
  const ConversationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 204, 219, 219),
        // automaticallyImplyLeading: false,
        // leading: IconButton(
        //   onPressed: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        //   icon: Icon(Icons.menu),
        //   iconSize: 30,
        // ),
        title: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceTint,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Icon(Icons.ac_unit_sharp, size: 30),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 40,
            icon: Icon(Icons.account_circle_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 204, 219, 219),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
              ConversationItem(),
            ],
          ),
        ),
      ),
    );
  }
}
