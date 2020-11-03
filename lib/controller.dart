import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/foodModel.dart';
import './services.dart';
class MyFoodController extends GetxController{
List<FoodModel> listData=List <FoodModel>().obs;


@override
  void onInit() {

  Services.fetchData();
    super.onInit();
  }

}