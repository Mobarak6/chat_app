// ignore_for_file: file_names

import 'dart:developer';

import 'package:firebase_auth_crud/controllers/controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class DataControllerBinding implements Bindings {
  @override
  void dependencies() {
    //log('firebase in');
    Get.lazyPut<DataController>(() => DataController());
    // Get.put(DataController());
    // TODO: implement dependencies
  }
}
