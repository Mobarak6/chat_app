// ignore_for_file: file_names
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_crud/controllers/messageController.dart';
import 'package:firebase_auth_crud/views/widgets/inputMessage.dart';
import 'package:firebase_auth_crud/views/widgets/messageBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({Key? key}) : super(key: key);
  final userData = Get.arguments;
//  final controller = Get.put(MessageController());
  void updateShowTime(String userNumber, String otherUserNumber, String docId,
      bool currentShowTime) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(userNumber)
        .collection(otherUserNumber)
        .doc(docId)
        .update({
      'showTime': !currentShowTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(userData['secend']),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('chats/${userData['frist']}/${userData['secend']}')
                .orderBy('time', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text(
                    'No Data...',
                  ),
                );
              }
              final document = snapshot.data!.docs;
              // log(document[0]['showTime'].toString());

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      reverse: true,
                      itemCount: document.length,
                      itemBuilder: (context, item) => MessageBox(
                        //  document[item]['message'],
                        document[item]['senderId'] == userData['frist'],
                        //   document[item]['time'],
                        item,
                        // document[item]['showTime'],
                        document,
                        userData,
                      ),
                      //    Text(document[item]['message']),
                    ),
                  ),
                  InputMessage(
                    fristUser: userData['frist'],
                    otherUser: userData['secend'],
                  ),
                ],
              );
            }),
      ),
    );
  }
}
