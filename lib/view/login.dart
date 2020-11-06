import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller/Login_controller.dart';
import 'package:login_getx_and_frach_data/servicesData/auth_Services.dart';
import 'package:login_getx_and_frach_data/view/register.dart';

class LoginPage extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("image/food_image.png")),

            Text(
              'Login',
              style: TextStyle(fontSize: 19),
            ),
            TextFormField(
              controller: _controller.emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),

            TextFormField(
              controller: _controller.passwordController,
              decoration: InputDecoration(labelText: "password"),
            ),
            RaisedButton(
              color: Colors.black38,
              onPressed: () {
                print(_controller.emailController.text);
                print(_controller.passwordController.text);

                AuthServices.authLogin();
              },
              child: Text("Login"),
            ),

            Row(
              children: [
                Text("i havem`t account"),
                FlatButton(
                    onPressed: () => Get.to(Register()), child: Text("Sign up "))
              ],
            )

            //   TextFormField(controller: ,)
          ],
        ),
      ),
    );
  }
}
