// ignore_for_file: file_names

import 'package:firebase_auth_crud/controllers/formController.dart';
import 'package:get/get.dart';

class FormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
    // TODO: implement dependencies
  }
}
