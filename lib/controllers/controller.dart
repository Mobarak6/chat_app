import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_crud/models/userModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  FirebaseFirestore? firestore;

  var userList = <User>[].obs;
  //User().obs;

  Future<void> delete(String id) async {
    try {
      await firestore!.collection("user").doc(id).delete();
      userList.removeWhere((element) => element.userId == id);
    } catch (e) {
      print(e);
    }
  }

  void readData() async {
    // var v = FirebaseFirestore.instance
    //     .collection('user')
    //     .orderBy('age')
    //     .snapshots();
    FirebaseFirestore.instance
        .collection('user')
        .orderBy('age')
        .snapshots()
        .listen((event) {
      var user = event.docs
          .map((e) => User(e.get('name'), e.get('age'), e.id))
          .toList();
      userList(user);
    });

    // });
    // var responce = await firestore!.collection('user').orderBy('age').get();

    // var user = responce.docs
    //     .map((e) => User(e.get('name'), e.get('age'), e.id))
    //     .toList();

    // userList(user);
  }

  Future<void> create(String name, int age) async {
    try {
      await firestore!.collection("user").add({
        'name': name,
        'age': age,
      });
      readData();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateUser(String name, num age, String id) async {
    try {
      await firestore!
          .collection("user")
          .doc(id)
          .update({'name': name, 'age': age});
      // readData();
    } catch (e) {
      print(e);
    }
  }

  initiliase() {
    // Firebase.initializeApp();
    firestore = FirebaseFirestore.instance;
    update();
  }

  @override
  void onInit() {
    Firebase.initializeApp();
    initiliase();
    //readData();

    // TODO: implement onInit
    super.onInit();
  }
}
