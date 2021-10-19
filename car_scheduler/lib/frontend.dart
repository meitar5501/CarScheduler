import 'package:flutter/material.dart';

class GreenFrog extends StatelessWidget {
  GreenFrog({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFF2DBD3A),
    child: Text("The car is not Here!"));
  }
}

class GetCarButton extends StatelessWidget {
  bool _car_is_here = false;

  GetCarButton(bool car_is_here)
  {
    _car_is_here = car_is_here;
  }

  @override
  Widget build(BuildContext context) {
    if (_car_is_here)
    {
      return Text("Return the car!");
    }
    else
    {
      return Text("get the car!");
    }
  }
}
