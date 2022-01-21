import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var SERVER_ADDR = 'http://127.0.0.1:8000/';

Future<bool> is_valid_login(username) async
{
  final response = await http.get(Uri.parse(SERVER_ADDR + 'users/' + username));
  print(response.body);
  Map<String, dynamic> json_response = jsonDecode(response.body);
  if (response.statusCode != 200)
  {
    return false;
  }

  return json_response['login'];
}

void check_login_data(context, text_controller) async
{
  print("Checking data");
  bool login_success = await is_valid_login(text_controller.text);
  if (login_success)
  {
    Navigator.pushNamed(
      context,
      '/carState',
      arguments: text_controller.text.toString(),
    );
  }
}
