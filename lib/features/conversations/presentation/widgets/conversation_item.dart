import 'package:chatapp/features/chat/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextButton(
      style: TextButton.styleFrom(shape: LinearBorder()),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle, size: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'John Doe',
                      style: textTheme.displaySmall?.copyWith(fontSize: 18),
                    ),
                    Icon(
                      Icons.volume_mute_rounded,
                      size: 20,
                      color: const Color.fromARGB(127, 0, 0, 0),
                    ),
                  ],
                ),
                Text(
                  'hello , how lorem ipsum uiu...',
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            Spacer(),
            Text('6:48PM', style: textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
