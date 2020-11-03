import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  List<String> steps;


  DetailsScreen(this.steps);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: steps.map((e) =>Text(e)).toList(),),);

  }
}
