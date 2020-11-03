import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller.dart';

import 'foodModel.dart';

class Services
{
static MyFoodController _controller=Get.find<MyFoodController>();

static  Future <List<FoodModel>> fetchData()async{
    String url="https://www.derastak.com/registration%20steps/food.json";

    Dio dio=Dio();

    Response response=await dio.get(url);

    if(response.statusCode==200){
      for(var item in response.data){
        _controller.listData.add(FoodModel.fromJson(item));
      }
      return _controller.listData;
    }
  }


}