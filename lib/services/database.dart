import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController {
  void sendMessage(
      String userNumber, String otherUserNumber, String message) async {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(userNumber)
        .collection(otherUserNumber)
        .doc()
        .set({
      'message': message,
      'senderId': userNumber,
      'time': Timestamp.fromDate(DateTime.now()),
      'showTime': false,
    });
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(otherUserNumber)
        .collection(userNumber)
        .doc()
        .set({
      'message': message,
      'senderId': userNumber,
      'time': Timestamp.fromDate(DateTime.now()),
      'showTime': false,
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
