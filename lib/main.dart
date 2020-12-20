import 'package:flutter/material.dart';
import 'package:music_classification/provider/classification_provider.dart';
import 'package:music_classification/provider/control_tones_provider.dart';
import 'package:music_classification/routes/router.dart' as router;
import 'package:music_classification/routes/router_constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClassificationData>(
          create: (context) => ClassificationData(),
        ),
         ChangeNotifierProvider<ControlTones>(
          create: (context) => ControlTones(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: router.onGenerateRoute,
        initialRoute: navigationRoute,
      ),
    );
  }
}
