// ignore_for_file: file_names

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_crud/controllers/controller.dart';
import 'package:firebase_auth_crud/models/userModel.dart';
import 'package:firebase_auth_crud/views/screens/userForm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final controller = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    controller.readData();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FireStore'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/userinput');
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: controller.userList.length,
            itemBuilder: (context, item) => GestureDetector(
              onTap: () {
                // controller.create('nahid', 60);

                // log('succes');
                // FirebaseFirestore.instance
                //     .collection('user')
                //     .snapshots()
                //     .listen((event) {
                //   event.docs.forEach((value) {
                //     log(value.get('name'));
                //   });
                // });
              },
              child: ListTile(
                onTap: () => Get.toNamed('/userinput',
                    arguments: controller.userList[item]),
                trailing: IconButton(
                    onPressed: () {
                      controller.delete(controller.userList[item].userId!);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red)),
                leading: CircleAvatar(
                  child: Text(controller.userList[item].age.toString()),
                ),
                title: Text(controller.userList[item].name!),
              ),
            ),
          );
        }),
      ),
    );
  }
}
