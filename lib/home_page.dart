import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class FoodHomePage extends StatelessWidget {
  MyFoodController _controller = Get.put(MyFoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => ListView.builder(
          itemCount: _controller.listData.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_controller.listData[index].name),
                subtitle: Image(
                    image: NetworkImage(_controller.listData[index].imageUrl)),
              leading: Icon(Icons.restaurant),),
            )));
  }
}
