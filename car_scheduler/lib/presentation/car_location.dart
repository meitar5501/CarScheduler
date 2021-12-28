import 'package:flutter/material.dart';


class CarHere extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('icons/car.png'),
          height: 200,
          width: 200,
        ),
        Center(
          child: Text(
            'The car is Here',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
        ),
      ]
    );
  }
}

class CarNotHere extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage('icons/stop.png'),
          height: 200,
          width: 200,
        ),
        Center(
          child: Text(
            'The car is not Here',
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
          ),
        ),
      ]
    );
  }
}
