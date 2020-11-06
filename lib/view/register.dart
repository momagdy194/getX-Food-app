import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller/Login_controller.dart';
import 'package:login_getx_and_frach_data/servicesData/auth_Services.dart';

class Register extends StatelessWidget {
  final AuthController _controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView (
        child: Column(
          children: [
            Image(image: AssetImage("image/food_image.png")),
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
              onPressed: () async {
                await AuthServices.authRegister();
              },
              child: Text("Register Now"),
            )
          ],
        ),
      ),
    );
  }
}
