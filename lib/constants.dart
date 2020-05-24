import 'package:demoflutterapp/dynamicListView.dart' as DynamicList;
import 'package:demoflutterapp/widgets.dart';
import 'package:flutter/material.dart';

class Constants {
  //AppBar
  static final String appBarTitle = "Demo Application";
  static final MaterialColor scaffoldBgColor = Colors.blue;

  //DynamicListView
  static int itemCount = listItems.length;
  static List<DynamicList.DynamicListView> listItems = new List();

  /// Constructor to add items in list view static list
  Constants.addListViewItems() {
    listItems.add(DynamicList.DynamicListView("Simple Gif", SimpleGifApp()));
    listItems.add(
        DynamicList.DynamicListView("Rows & Columns Example", RowsAndColumn()));
    listItems.add(DynamicList.DynamicListView(
        "Static List View Example", StaticListView()));
    listItems.add(
        DynamicList.DynamicListView("Visiting Card Example", ContactCard()));
    listItems
        .add(DynamicList.DynamicListView("Lets roll the dice", RollDice()));
    listItems.add(DynamicList.DynamicListView("Xylophone", Xylophone()));
  }
}
