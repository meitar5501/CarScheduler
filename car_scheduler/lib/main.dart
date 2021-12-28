/// Flutter code sample for Scaffold

// This example shows a [Scaffold] with an [AppBar], a [BottomAppBar] and a
// [FloatingActionButton]. The [body] is a [Text] placed in a [Center] in order
// to center the text within the [Scaffold]. The [FloatingActionButton] is
// centered and docked within the [BottomAppBar] using
// [FloatingActionButtonLocation.centerDocked]. The [FloatingActionButton] is
// connected to a callback that increments a counter.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold_bottom_app_bar.png)

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import './login.dart';
// import './schedule.dart';
// import './car_state.dart';

import './route_generator.dart';

void main() {
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp() : super();

  static const String _title = 'CarScheduler';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      // routes: {
      //   '/': (context) => Login(),
      //   '/carState': (context) => CarState(),
      //   '/schedule': (context) => Schedule(),
      // },
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generate_route,
    );
  }
}
