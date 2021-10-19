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
import 'dart:async'; // new
import 'backend.dart';
import 'frontend.dart';
//import 'package:cloud_firestore/cloud_firestore.dart'; // new
// import 'src/widgets.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp() : super();

  static const String _title = 'CarScheduler';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: CarScheduler(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class CarScheduler extends StatefulWidget {
  const CarScheduler() : super();

  @override
  State<CarScheduler> createState() => _CarSchedulerState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _CarSchedulerState extends State<CarScheduler> {
  static const String _title = "CarScheduler";
  late Future<Album> car_location;
  bool _isHere = true;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    car_location = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_CarSchedulerState._title),
      ),
      body: Center(
            child: FutureBuilder<Album>(
              future: car_location,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GreenFrog();
                  // return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
        ),
        // AddUser("shlomo", "shimon", 14)
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          car_location = fetchAlbum();
        }),
        child: FutureBuilder<Album>(
              future: car_location,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GetCarButton(false);
                  // return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              },
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

/*
class AddUser extends StatelessWidget {
  final String fullName;
  final String company;
  final int age;

  AddUser(this.fullName, this.company, this.age);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'full_name': fullName, // John Doe
            'company': company, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
*/
