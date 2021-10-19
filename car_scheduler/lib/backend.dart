import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Album {
  int userId = 4;
  int id = 3;
  String title = "Blah";

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://localhost:5501/hello'));

  if (response.statusCode == 200) {
    print("Hello!!");
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return Album.fromJson({
      "userId": 1,
      "id": 3,
      "title": response.body
    });
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
