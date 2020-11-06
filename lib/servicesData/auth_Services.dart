import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller/Login_controller.dart';
import 'package:login_getx_and_frach_data/view/home_page.dart';
import 'package:login_getx_and_frach_data/view/login.dart';

class AuthServices {
  static FirebaseAuth firebase = FirebaseAuth.instance;

  static authLogin() async {
    Future.delayed(Duration.zero, () {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
    });
    try {
      final users = await firebase.signInWithEmailAndPassword(
          email: AuthController.controller.emailController.text,
          password: AuthController.controller.passwordController.text);
      print("ssss${users.user.uid}");
      if (!users.user.isNull) {
        Get.back();
        Get.offAll(FoodHomePage());
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.back();
      if (e.code == 'user-not-found') {
        return Get.snackbar("Error", "user-not-found");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided for that user.");
        print('Wrong password provided for that user.');
      } else {
        Get.snackbar("Error", "Cant Login");
      }
    }
//    .then((v) {
//
//        Get.to(FoodHomePage());
//        AuthController.controller.emailController.clear();
//        AuthController.controller.passwordController.clear();
//          }).catchError((e) {
//        Get.back();
//        if (e.code == 'user-not-found') {
//          return Get.snackbar("Error", "user-not-found");
//        } else if (e.code == 'wrong-password') {
//          Get.snackbar("Error", "The password provided is too weak");
//          print('Wrong password provided for that user.');
//        } else {
//          Get.snackbar("Error", "Cant Login");
//        }
//      });
//    } on FirebaseAuthException catch (e) {
//      print(e);
//    }
  }

  static authRegister() async {
    Future.delayed(Duration.zero, () {
      Get.dialog(Center(
        child: CircularProgressIndicator(),
      ));
    });
    try {
      firebase
          .createUserWithEmailAndPassword(
              email: AuthController.controller.emailController.text,
              password: AuthController.controller.passwordController.text)
          .then((v) {
            Get.to(LoginPage());
            AuthController.controller.emailController.clear();
            AuthController.controller.passwordController.clear();
          })
          .whenComplete(() => Get.back())
          .catchError((e) {
            if (e.code == 'weak-password') {
              Get.defaultDialog(
                  title: "Error",
                  middleText: "The password provided is too weak");
            } else if (e.code == 'email-already-in-use') {
              Get.defaultDialog(
                  title: "Error",
                  middleText: "The account already exists for that email");
            }
          });
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
