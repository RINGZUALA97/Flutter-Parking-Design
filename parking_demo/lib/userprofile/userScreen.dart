import 'package:flutter/material.dart';
import 'package:parking_demo/Booking/screen.dart';

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (ParkingDetailScreen())));
                  },
                ),
              ),
              SizedBox(
                height: 20,
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
            ],
          ),
        ),
      ),
    );
  }
}
