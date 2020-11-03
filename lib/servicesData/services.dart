

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller/controller.dart';
import 'package:login_getx_and_frach_data/model/foodModel.dart';

var _controller=MyFoodController.to;

class DataServices {
  static Future<List<FoodModel>> fetchData() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    String url = "https://www.derastak.com/registration%20steps/food.json";

    Dio dio = Dio();

    Response response = await dio.get(url);
    Get.back();
    if (response.statusCode == 200) {
      for (var item in response.data) {
        _controller.listData.add(FoodModel.fromJson(item));
      }
      return _controller.listData;
    }
  }
}
