// ignore_for_file: file_names
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  TextEditingController messageController = TextEditingController();
  var duration = Duration().obs;
  var showTime = false.obs;
}
