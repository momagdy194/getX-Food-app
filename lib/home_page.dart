import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class FoodHomePage extends StatelessWidget {
  MyFoodContrroller _contrroller = Get.put(MyFoodContrroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => ListView.builder(
          itemCount: _contrroller.ListData.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_contrroller.ListData[index].name),subtitle: Image(image: NetworkImage(_contrroller.ListData[index].imageUrl)),
              ),
            )),
      ),
    );
  }
}
