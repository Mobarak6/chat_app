// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_crud/controllers/messageController.dart';
import 'package:firebase_auth_crud/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageBox extends StatelessWidget {
  MessageBox(
    // this.message,
    this.isMe,
    // this.timestamp,
    this.index,
    //  this.showTime,
    this.document,
    this.userData,
  );

  // final String message;
  final bool isMe;
  // final Timestamp timestamp;
  final int index;
  // final bool showTime;
  final List<QueryDocumentSnapshot<Object?>> document;
  final userData;
  final messageController = Get.put(MessageController());
  final dataBaseController = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    String message = document[index]['message'];
    var timeStamp = document[index]['time'].toDate();
    var time = DateTime.now().difference(timeStamp);
    bool showTime = document[index]['showTime'];
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.grey[400] : Colors.blue[400],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: isMe
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              //width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8,
              ),
              child: GestureDetector(
                onTap: () async {
                  dataBaseController.updateShowTime(userData['frist'],
                      userData['secend'], document[index].id, showTime);
                },
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w400,
                      //fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            showTime
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: time.inMinutes < 59
                        ? Text(
                            '${time.inMinutes} minites ago',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          )
                        : Text(
                            '${time.inHours} hours ago',
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 12,
                            ),
                          ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
