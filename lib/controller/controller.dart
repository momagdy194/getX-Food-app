
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/model/foodModel.dart';
import 'package:login_getx_and_frach_data/servicesData/services.dart';

class MyFoodController extends GetxController{
List<FoodModel> listData=List <FoodModel>().obs;
var _x;


get x => _x;

static  get  to =>Get.find<MyFoodController>();

@override
  void onInit() {

  DataServices.fetchData();
    super.onInit();
  }

}