import 'package:flutter/material.dart';
import 'package:responsive_widget/responsive_widget.dart';

class DetailsScreen extends StatelessWidget {
  final name, imageURL;

  final List<String> stepsL;

  DetailsScreen(this.name, this.stepsL, this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: ResponsiveUi(
        builder: (context, size) => ListView(
          children: [
            Image(
              image: NetworkImage(imageURL),
              height: size.mediumImage,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Card(
                color: Colors.white24,
                child: Text(
                  name,
                  style: TextStyle(fontSize: size.titleText),
                )),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: stepsL
                    .map((e) => Text(
                          e,
                          style: TextStyle(
                              fontSize: size.normalText,
                              wordSpacing: 2,
                              letterSpacing: 1),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
