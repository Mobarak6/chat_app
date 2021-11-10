// ignore_for_file: file_names

import 'dart:developer';

import 'package:firebase_auth_crud/controllers/controller.dart';
import 'package:firebase_auth_crud/controllers/formController.dart';
import 'package:firebase_auth_crud/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFrom extends StatelessWidget {
  UserFrom({Key? key}) : super(key: key);
  final controller = Get.find<FormController>();
  final dataController = Get.find<DataController>();
  final userData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input'),
        actions: [
          IconButton(
            onPressed: () {
              if (userData == null) {
                dataController.create(controller.nameController.value.text,
                    int.parse(controller.ageController.value.text));
                Get.back();
              } else {
                dataController.updateUser(
                    controller.nameController.value.text,
                    int.parse(controller.ageController.value.text),
                    userData.userId!);
                Get.back();
              }
            },
            icon: Icon(Icons.done),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextFormField(
                //  initialValue: userData != null ? userData.name! : '',
                controller: controller.nameController,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                // initialValue: userData!=null? userData.age:  '' ,
                keyboardType: TextInputType.number,
                controller: controller.ageController,
                decoration: const InputDecoration(
                  hintText: 'User Age',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
