import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:section14/widgets/chat_massenger.dart';
import 'package:section14/widgets/new_massenger.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  void setupPushNotification() async {
    final fcm = FirebaseMessaging.instance;

    await fcm.requestPermission();

    fcm.subscribeToTopic('chat');

  }

  @override
  void initState() {
    super.initState();
    
    setupPushNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlutterChat'),
        actions: [IconButton(onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        icon: Icon(Icons.exit_to_app, color: Theme.of(context).colorScheme.primary,
        ),
        ),
        ],
      ),
      body: Column(children: [
        Expanded(child: ChatMessage(),
        ),
        NewMassenger(),
      ],),
    );
  }
}