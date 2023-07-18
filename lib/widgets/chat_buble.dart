import 'package:flutter/material.dart';
import 'package:scholar_chat_setup/models/message.dart';

import 'const.dart';

class ChatBuble extends StatelessWidget {
  const ChatBuble({Key? key,required this.message}) : super(key: key);

 final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        padding: EdgeInsets.only(left: 32 , top: 32, bottom: 32 , right: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: KPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(
              color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  const ChatBubleForFriend({Key? key,required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 8),
        padding: EdgeInsets.only(left: 32 , top: 32, bottom: 32 , right: 32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color(0xff006D84),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
