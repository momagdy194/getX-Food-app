import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'foodModel.dart';


class ServicesData {

 static MyFoodContrroller to =  Get.find<MyFoodContrroller>();

  static Future<List<FoodModel>> apiGetUserList() async {
    String url = "https://www.derastak.com/registration%20steps/food.json";
    Dio dio = Dio();
    Response response = await dio.get(url);

    try {
      if (response.statusCode == 200) {
        for (var item in response.data) {
          to.ListData.add(FoodModel.fromJson(item));
        }
        return to.ListData;
      }
    } catch (e) {
      print(e);
    }
  }

}
