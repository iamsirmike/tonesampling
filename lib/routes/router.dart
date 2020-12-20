import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_classification/routes/router_constants.dart';
import 'package:music_classification/screens/classicfication.dart';
import 'package:music_classification/screens/navigation.dart';
import 'package:music_classification/screens/index.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case navigationRoute:
      return MaterialPageRoute(builder: (context) => Navigation());
    case indexPageRoute:
      return MaterialPageRoute(builder: (context) => Index());
    case classificationPageRoute:
      return MaterialPageRoute(builder: (context) => Classification());
    default:
      return MaterialPageRoute(builder: (context) => Index());
  }
}
