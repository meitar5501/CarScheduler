import 'package:flutter/material.dart';

void check_login_data(context, text_controller)
{
  print("Checking data");
  print(text_controller.text);
  Navigator.pushNamed(
    context,
    '/carState',
  );
}
