import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddScreen extends StatefulWidget {
  String name;

  AddScreen({this.name});
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text(''),
            )
          ],
        ),
      ),
    );
  }
}
