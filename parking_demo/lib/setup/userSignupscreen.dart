import 'package:flutter/material.dart';
import 'package:parking_demo/setup/setup_provider.dart';

import 'package:parking_demo/userprofile/userscreenBar.dart';

import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();

class BusinessProfile extends StatefulWidget {
  BusinessProfile({Key key}) : super(key: key);

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {
  // final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Your Details'),
      ),
      body: Consumer<SetupProvider>(
        builder: (context, model, child) {
          return Form(
            key: _formKey,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Enter Name',
                            ),
                            onChanged: (value) {
                              model.setName(value);
                              print('enetr name is $value');
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            // controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Address',
                            ),
                            onChanged: (value) {
                              model.setAddress(value);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Khawngaihin Address dah rawh';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            // controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Motor Number',
                            ),
                            onChanged: (value) {
                              model.setmOTORnO(value);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Khawngaihin Address dah rawh';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            // controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                            ),
                            onChanged: (value) {
                              model.setEmail(value);
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Khawngaihin Email dah rawh';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.05,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                'Next',
                                style: TextStyle(color: Colors.black),
                              )),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (UserHomeScreen())));

                              model.saveUSEprofile();
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
