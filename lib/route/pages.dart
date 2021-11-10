import 'package:firebase_auth_crud/bindings/dataControllerBinding.dart';
import 'package:firebase_auth_crud/bindings/formBinding.dart';
import 'package:firebase_auth_crud/bindings/userBinding.dart';
import 'package:firebase_auth_crud/views/screens/authScreen.dart';
import 'package:firebase_auth_crud/views/screens/messageScreen.dart';
import 'package:firebase_auth_crud/views/screens/myHomePage.dart';
import 'package:firebase_auth_crud/views/screens/userForm.dart';
import 'package:firebase_auth_crud/views/screens/userScreen.dart';
import 'package:get/get.dart';

class RouteApp {
  static const home = '/home';
  static const userForm = '/userinput';
  static const authScreen = '/authScreen';
  static const user = '/userScreen';
  static const messageScreen = '/messageScreen';
}

class AppPages {
  static const INITIAL = RouteApp.user;
  static final routes = [
    GetPage(
      name: '/home',
      page: () => MyHomePage(),
      binding: DataControllerBinding(),
    ),
    GetPage(
      name: '/userinput',
      page: () => UserFrom(),
      binding: FormBinding(),
    ),
    GetPage(
      name: RouteApp.authScreen,
      page: () => AuthScreen(),
    ),
    GetPage(
      name: RouteApp.user,
      page: () => UserScreen(),
      binding: UserBinding(),
    ),
    GetPage(
      name: RouteApp.messageScreen,
      page: () => MessageScreen(),
      // binding: UserBinding(),
    )
  ];
}
