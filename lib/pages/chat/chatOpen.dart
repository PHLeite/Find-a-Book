import 'package:flutter/material.dart';

class ChatOpen extends StatefulWidget {
  const ChatOpen({ Key? key }) : super(key: key);

  @override
  _ChatOpenState createState() => _ChatOpenState();
}

class _ChatOpenState extends State<ChatOpen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('chat')),
    );
  }
}