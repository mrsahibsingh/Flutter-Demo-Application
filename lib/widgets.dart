import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

/// Dynamic list view example
class DynamicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Constants.addListViewItems();
    return Container(
      child: ListView.builder(
        itemCount: Constants.itemCount,
        itemExtent: 60.0, //height of each item.
        itemBuilder: buildDynamicListViewBody,
      ),
    );
  }
}

/// Method to build Dynamic List View Body
/// Used in DynamicListView class
Widget buildDynamicListViewBody(BuildContext ctxt, int index) {
  return new Card(
    child: ListTile(
      onTap: () {
        Navigator.push(
          ctxt,
          MaterialPageRoute(
            builder: (context) {
              return SecondPage(Constants.listItems[index].link);
            },
          ),
        );
      },
      title: Text(
        "${(index + 1).toString()}) ${Constants.listItems[index].name}",
        style: Theme.of(ctxt).textTheme.headline6,
      ),
    ),
  );
}

class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
      title: Text(Constants.appBarTitle),
    );
  }
}

/// Module to play different sounds on different color clicks.
class Xylophone extends StatelessWidget {
  void playSound(int num) {
    final player = AudioCache();
    player.play("sounds/note$num.wav");
  }

  Expanded getExpanded(Color color, int trackNum) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          playSound(trackNum);
        },
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          "Click on different colors to play sounds!",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20,
            wordSpacing: 2.5,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        getExpanded(Colors.red, 1),
        getExpanded(Colors.orange, 2),
        getExpanded(Colors.green, 3),
        getExpanded(Colors.yellow, 4),
        getExpanded(Colors.teal, 5),
        getExpanded(Colors.white, 6),
        getExpanded(Colors.purple, 7),
      ],
    );
  }
}

/// A simple module to display random images on click of a button.
class RollDice extends StatefulWidget {
  @override
  _RollDiceState createState() => _RollDiceState();
}

class _RollDiceState extends State<RollDice> {
  int leftDiceNumber = 1, rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Click on the dice!",
          style: TextStyle(
            color: Colors.yellowAccent,
            fontSize: 20,
            wordSpacing: 2.5,
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              //To dynamically change size of child widget instead of hardcoded size
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset("assets/images/dice$leftDiceNumber.png"),
              ),
            ),
            Expanded(
              //To dynamically change size of child widget instead of hardcoded size
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    rightDiceNumber = Random().nextInt(6) + 1;
                  });
                },
                child: Image.asset("assets/images/dice$rightDiceNumber.png"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Visiting card using column widget.
class ContactCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 50.0,
          backgroundImage: AssetImage("assets/images/diamond.gif"),
        ),
        Text(
          "Sahib Singh",
          style: GoogleFonts.pacifico(
            fontSize: 40.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "FLUTTER DEVELOPER",
          style: GoogleFonts.sourceSansPro(
            color: Colors.teal.shade100,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.5,
          ),
        ),
        SizedBox(
          height: 20.0,
          width: 200.0,
          child: Divider(
            color: Colors.teal.shade100,
          ),
        ),
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            title: Text(
              "+91 987 654 321",
              style: GoogleFonts.sourceSansPro(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            title: Text(
              "example@mail.com",
              style: GoogleFonts.sourceSansPro(
                fontSize: 20.0,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Simply returning a second page
/// Used in buildDynamicListViewBody class
class SecondPage extends StatelessWidget {
  @override
  Widget widgetName;

  SecondPage(Widget name) {
    this.widgetName = name;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBgColor,
      appBar: ReusableWidgets.getAppBar(),
      body: widgetName,
    );
  }
}

/// Static list view example
class StaticListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Item 1')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Item 2')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Item 3')),
        ),
      ],
    );
  }
}

/// A widget implementing rows and columns widget.
class RowsAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0),
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Column Example",
            style: TextStyle(
              color: Colors.yellowAccent,
              fontSize: 20,
              wordSpacing: 2.5,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.blue.shade100,
            child: Text(
              "Container 1",
              textAlign: TextAlign.center,
            ),
            height: 100.0,
            width: 120.0,
            margin: EdgeInsets.only(left: 20.0),
            padding: EdgeInsets.all(20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100.0,
            width: 120.0,
            color: Colors.blue.shade200,
            child: Text(
              "Container 2",
              textAlign: TextAlign.center,
            ),
            margin: EdgeInsets.only(left: 20.0),
            padding: EdgeInsets.all(20.0),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.blue.shade300,
            height: 100.0,
            width: 120.0,
            child: SimpleGifApp(),
            margin: EdgeInsets.only(left: 20.0),
            padding: EdgeInsets.all(20.0),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Divider(
              color: Colors.white,
              thickness: 1.5,
            ),
            width: 200.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Row Example",
            style: TextStyle(color: Colors.yellowAccent, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Container(
                color: Colors.blue.shade100,
                child: Text(
                  "Container 1",
                  textAlign: TextAlign.center,
                ),
                height: 100.0,
                width: 100.0,
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 100.0,
                width: 100.0,
                color: Colors.blue.shade200,
                child: Text(
                  "Container 2",
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.all(20.0),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                color: Colors.blue.shade300,
                height: 100.0,
                width: 100.0,
                child: SimpleGifApp(),
                padding: EdgeInsets.all(20.0),
              )
            ],
          )
        ],
      ),
    );
  }
}

/// A widget showing just a gif image.
class SimpleGifApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/diamond.gif"),
        radius: 150.0,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
