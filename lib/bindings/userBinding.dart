// ignore_for_file: file_names

import 'package:firebase_auth_crud/controllers/userController.dart';
import 'package:firebase_auth_crud/views/screens/userScreen.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
    // TODO: implement dependencies
  }
}
