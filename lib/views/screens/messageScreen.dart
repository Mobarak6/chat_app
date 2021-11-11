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

  void updateSeen(
    String userNumber,
    String otherUserNumber,
    String docId,
  ) {
    FirebaseFirestore.instance
        .collection('chats')
        .doc(otherUserNumber)
        .collection(userNumber)
        .doc(docId)
        .update({
      'isSeen': true,
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
              if (document.isNotEmpty) {
                updateSeen(
                    userData['frist'], userData['secend'], document[0].id);
              }

              return Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          reverse: true,
                          itemCount: document.length,
                          itemBuilder: (context, item) {
                            // return FutureBuilder<QuerySnapshot>(
                            //     future: otherUserDoc(
                            //         userData['frist'], userData['secend']),
                            //     builder: (context, otherSnapshot) {
                            //       if (otherSnapshot.connectionState ==
                            //           ConnectionState.waiting) {
                            //         return const Center(
                            //             child: Text('loading...'));
                            //       }

                            //       final otherDocument = otherSnapshot.data!.docs;
                            //       // var list =
                            //       //     otherDocument.map((e) => e.id).toList();

                            //       if (document[item]['senderId'] ==
                            //           userData['secend']) {
                            //         updateSeen(
                            //           userData['frist'],
                            //           userData['secend'],
                            //           document[item].id,
                            //           //  list,
                            //           //  otherDocument[item].id,
                            //           true,
                            //           otherDocument,
                            //         );
                            //       }
                            return MessageBox(
                              document[item]['senderId'] == userData['frist'],
                              item,
                              document,
                              userData,
                            );
                          })

                      //    Text(document[item]['message']),
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
