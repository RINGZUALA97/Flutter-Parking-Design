import 'package:flutter/material.dart';

class ParkingDetailScreen extends StatefulWidget {
  @override
  _ParkingDetailScreenState createState() => _ParkingDetailScreenState();
}

class _ParkingDetailScreenState extends State<ParkingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Details'),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Text('Name: Pahoss Parking 1'),
            Text('Address: 3/Z/32 Avenew Street'),
            Text('Type of Vehicle: Two wheeler/LMV'),
            Text('')
          ],
        ),
      )),
    );
  }
}
