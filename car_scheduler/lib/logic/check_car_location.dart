import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

var SERVER_ADDR = 'http://127.0.0.1:8000/';

Future<bool> car_is_here(username) async
{
  print(username);
  final response = await http.get(Uri.parse(SERVER_ADDR + 'car_state/' + username));
  print(response.body);
  Map<String, dynamic> json_response = jsonDecode(response.body);
  if (response.statusCode != 200)
  {
    return false;
  }

  return (json_response['car_location'] == username);
}
