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

import './presentation/background.dart';
import './presentation/car_location.dart';

import './logic/check_login_data.dart';

class CarState extends StatefulWidget {

  const CarState();

  @override
  _CarStateState createState() => _CarStateState();
}

class _CarStateState extends State<CarState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: get_background(),
        child: Column (
            children: <Widget>[
              SizedBox(height: 80,),
              Center(
                child: Text(
                  'Car Scheduler',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 50,
                    letterSpacing: 2,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              CarHere(),
              SizedBox(height: 100,),
              Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.green,
                ),
                child:
                  TextButton(
                    onPressed: () {
                      print("Refreshing ");
                    },
                    child: Text("Refresh", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
              ),
            ],
        ),
      )
    );
  }
}
