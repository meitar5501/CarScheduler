import 'package:flutter/material.dart';
import './login.dart';
import './schedule.dart';
import './car_state.dart';

class RouteGenerator {
  static Route<dynamic> generate_route(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/carState':
        return MaterialPageRoute(builder: (_) => CarState());

      default:
        return MaterialPageRoute(builder: (_) => Text("Error"));
    }

    return MaterialPageRoute(builder: (_) => Text("Error"));
  }
}
