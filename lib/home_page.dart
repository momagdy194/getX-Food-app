import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/details_Screen.dart';
import 'controller.dart';

class FoodHomePage extends StatelessWidget {
  MyFoodContrroller _contrroller = Get.put(MyFoodContrroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(() => ListView.builder(
              itemCount: _contrroller.ListData.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
//                        builder: (context) => DetailsScreen(steps),
                      )),
                  title: Text(_contrroller.ListData[index].name),
                  subtitle: Image(
                      image:
                          NetworkImage(_contrroller.ListData[index].imageUrl)),
                ),
              ),
            )),
      ),
    );
  }
}
