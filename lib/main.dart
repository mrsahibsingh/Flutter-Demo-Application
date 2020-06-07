import 'package:demoflutterapp/constants.dart';
import 'package:demoflutterapp/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Constants.scaffoldBgColor,
        appBar: ReusableWidgets.getAppBar(),
        body: DynamicListView(),
      ),
    );
  }
}
