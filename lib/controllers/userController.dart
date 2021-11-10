// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  TextEditingController fristUser = TextEditingController();
  TextEditingController secendUser = TextEditingController();

  @override
  void onClose() {
    fristUser.dispose();
    secendUser.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
