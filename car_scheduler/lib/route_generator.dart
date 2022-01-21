import 'package:flutter/material.dart';
import './login.dart';
import './schedule.dart';
import './car_state.dart';
import 'dart:convert';


class RouteGenerator {
  static Route<dynamic> generate_route(RouteSettings settings) {

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Login());
      case '/carState':
        String username = settings.arguments.toString();
        return MaterialPageRoute(builder: (BuildContext context){
          return CarState(username:username);
        });
      default:
        return MaterialPageRoute(builder: (_) => Text("Error"));
    }

    return MaterialPageRoute(builder: (_) => Text("Error"));
  }
}
