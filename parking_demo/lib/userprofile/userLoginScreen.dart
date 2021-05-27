import 'package:flutter/material.dart';
import 'package:parking_demo/userprofile/userscreenBar.dart';

class UserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('Enter Personal Details'),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 40,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Enter Your Name'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 40,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Address'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 40,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Motor Type and Number'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 40,
              ),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'Ph No'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (UserHomeScreen())));
                  },
                  child: Text('Submit')),
            )
          ],
        ),
      ),
    );
  }
}
