import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller/controller.dart';
import 'package:login_getx_and_frach_data/view/login.dart';
import 'package:responsive_widget/responsive_widget.dart';

import 'details_Screen.dart';

class FoodHomePage extends StatelessWidget {
//  final MyFoodController _controller = Get.put(MyFoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Center(
            child: RaisedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Get.off(LoginPage());
              },
              child: Text("Logout"),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('HomeScreen'),
        ),
        body: GetX<MyFoodController>(
          init: MyFoodController(),
          builder: (controller) =>
            ListView.builder(
              itemCount: controller.listData.length,
              itemBuilder: (context, index) =>
                  Card(
                    child: ListTile(
                      onTap: () =>
                          Get.to(DetailsScreen(
                              controller.listData[index].name,
                              controller.listData[index].steps,
                              controller.listData[index].imageUrl)),
                      title: Text(
                        controller.listData[index].name,
                      ),
                      subtitle: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Image(
                            image:
                            NetworkImage(controller.listData[index].imageUrl)),
                      ),
                      leading: Icon(Icons.restaurant),
                    ),
                  ),
            ),

        ));
  }
}
