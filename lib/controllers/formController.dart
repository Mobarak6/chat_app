// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void onClose() {
    nameController.dispose();
    ageController.dispose();
    // TODO: implement onClose
    super.onClose();
  }
}
