import 'package:flutter/material.dart';
import 'package:music_classification/screens/classicfication.dart';
import 'package:music_classification/screens/index.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentIndex = 0;

  final bottomItems = [
    {'icon': Icon(Icons.home), 'text': 'Home'},
    {"icon": Icon(Icons.menu), 'text': 'Classification'},
  ];

  final pages = [
    Index(),
    Classification(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(0),
        height: height / 10,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomItems
                .asMap()
                .map((i, icon) {
                  bool active = i == currentIndex;
                  final color = active ? Colors.blue : Color(0Xff999999);
                  Widget button;

                  button = Column(
                    children: <Widget>[
                      IconButton(
                        icon: icon["icon"],
                        color: color,
                        onPressed: () => setState(() => currentIndex = i),
                      ),
                      active
                          ? Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            )
                          : Text(
                              icon["text"].toString(),
                              style: TextStyle(
                                color: color,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ],
                  );
                  return MapEntry(i, button);
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
