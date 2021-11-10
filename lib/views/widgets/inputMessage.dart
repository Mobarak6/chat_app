// ignore_for_file: file_names

import 'package:firebase_auth_crud/controllers/messageController.dart';
import 'package:firebase_auth_crud/services/database.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InputMessage extends StatelessWidget {
  final String fristUser;
  final String otherUser;

  final messageTextController = Get.put(MessageController());
  final dataController = Get.find<DatabaseController>();

  InputMessage({Key? key, required this.fristUser, required this.otherUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: messageTextController.messageController,
              decoration: const InputDecoration(labelText: 'Text message...'),
            ),
          ),
          IconButton(
              color: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.send,
                color: Colors.green,
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                dataController.sendMessage(
                  fristUser,
                  otherUser,
                  messageTextController.messageController.text,
                );
                messageTextController.messageController.clear();
              })
        ],
      ),
    );
  }
}
