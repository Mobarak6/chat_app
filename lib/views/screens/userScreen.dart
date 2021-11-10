// ignore_for_file: file_names

import 'package:firebase_auth_crud/controllers/userController.dart';
import 'package:firebase_auth_crud/route/pages.dart';
import 'package:firebase_auth_crud/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);
  final controller = Get.find<UserController>();
  final databaseController = Get.put(DatabaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('User'),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(RouteApp.messageScreen, arguments: {
                  'frist': controller.fristUser.text,
                  'secend': controller.secendUser.text,
                });
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.fristUser,
                  decoration: const InputDecoration(
                    hintText: ' Frist User',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: controller.secendUser,
                  decoration: const InputDecoration(
                    hintText: 'Secend User',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
