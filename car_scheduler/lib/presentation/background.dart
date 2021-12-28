import 'package:flutter/material.dart';

BoxDecoration get_background()
{
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
                Color(0xffb3ecff),
                Color(0xff4dd2ff),
                Color(0xff007399),
            ]
        )
    );
}
