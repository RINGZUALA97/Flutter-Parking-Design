import 'package:flutter/material.dart';

import 'package:parking_demo/db/screen.dart';
import 'package:parking_demo/userprofile/parkingDetail_Screen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PAHOSS Parking'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text('MSEG PAHOSS PARKING'),
                      Text('3/7 Aveneu Street,Bhivam Nagar'),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Parking available for:'),
                      Text('2 Wheeler and LMV of 24 hours'),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (Screen())));
                      },
                      child: Text('Book Parking'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {}, child: Text('Open Location in GMap')),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text('Parking Data'),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (ParkingDetailScreen())));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
