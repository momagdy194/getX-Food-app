import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'foodModel.dart';
import './services.dart';

class MyFoodContrroller extends GetxController {
  var ListData = List<FoodModel>().obs;

  @override


  void onInit() {
    ServicesData.apiGetUserList();
    super.onInit();
  }
}
