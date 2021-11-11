import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  void sendMessage(
      String userNumber, String otherUserNumber, String message) async {
    var docId = await FirebaseFirestore.instance
        .collection('chats')
        .doc(userNumber)
        .collection(otherUserNumber)
        .add({
      'message': message,
      'senderId': userNumber,
      'time': Timestamp.fromDate(DateTime.now()),
      'showTime': false,
      'isSeen': false,
    });

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(otherUserNumber)
        .collection(userNumber)
        .doc(docId.id)
        .set({
      'message': message,
      'senderId': userNumber,
      'time': Timestamp.fromDate(DateTime.now()),
      'showTime': false,
      'isSeen': false,
    });
  }

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
}
