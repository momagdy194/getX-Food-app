import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController emailController;
  TextEditingController passwordController;

static AuthController get controller => Get.find<AuthController>();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();

    super.dispose();
  }
}
