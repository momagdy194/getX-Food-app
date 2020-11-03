
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_getx_and_frach_data/controller/controller.dart';
import 'package:responsive_widget/responsive_widget.dart';

import 'details_Screen.dart';

class FoodHomePage extends StatelessWidget {
  final MyFoodController _controller = Get.put(MyFoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen'),),
      body: Obx(() =>
          ResponsiveUi(
            builder: (context, size) => ListView.builder(
                itemCount: _controller.listData.length,
                itemBuilder: (context, index) =>
                    Card(
                        child: ListTile(
                            onTap: ()=>Get.to(DetailsScreen(_controller.listData[index].name,
                                _controller.listData[index].steps,
                                _controller.listData[index].imageUrl
                                                             )),
        title: Text(_controller.listData[index].name,),
        subtitle: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            child: Image(
                image:
                NetworkImage(_controller.listData[index].imageUrl)),
        ),
        leading: Icon(Icons.restaurant),
      ),
    ),),
          )
    )
    );
  }
}
