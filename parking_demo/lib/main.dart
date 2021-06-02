import 'package:flutter/material.dart';
import 'package:parking_demo/Booking/newCreen.dart';

import 'package:parking_demo/userprofile/addpakingScreen.dart';
import 'package:parking_demo/userprofile/userscreenBar.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pahoss',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (AdminLoginScreen())));
              },
              child: Text('Admin Login'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => (SceenForUser())));
              },
              child: Text('User Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (UserHomeScreen())));
              },
              child: Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  String names;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Parking'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: TextFormField(
                onChanged: (value) {
                  names = value;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Name of Parking',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Type of Vehicle',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Number of Slots',
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (AddScreen(
                                name: names,
                              ))));
                },
                child: Text('Submit')),
          ],
        ),
      ),
    );
  }
}

//   _submitting() {
//     lists(){
//       Expanded(
//       child: Card(
//         child: ListView.builder(
//           itemBuilder: (context, index) {
//             return Column(
//               children: [
//                 Container(
//                   color: Colors.blueAccent,
//                   child: Column(
//                     children: [Text('dasd')],
//                   ),
//                 )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//     }
//   }
// }
