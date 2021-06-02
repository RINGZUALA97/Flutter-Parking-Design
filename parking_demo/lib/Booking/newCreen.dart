import 'package:flutter/material.dart';

import 'package:parking_demo/Booking/employee.dart';
import 'package:parking_demo/Booking/helper.dart';
import 'package:parking_demo/userprofile/userscreenBar.dart';

class SceenForUser extends StatefulWidget {
  const SceenForUser({Key key}) : super(key: key);

  @override
  _SceenForUserState createState() => _SceenForUserState();
}

class _SceenForUserState extends State<SceenForUser> {
  final _formKey = GlobalKey<FormState>();
  String names;
  // Register _register;
  Register _register = Register();
  DatabaseHelpering _reHelp;
  @override
  void initState() {
    super.initState();
    setState(() {
      _reHelp = DatabaseHelpering.instance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                    onSaved: (value) => setState(
                          () => _register.username = value,
                        ),
                    decoration: InputDecoration(
                      labelText: 'Enter Name',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    }),
                TextFormField(
                    onSaved: (value) => setState(
                          () => _register.usernumber = value,
                        ),
                    decoration: InputDecoration(
                      labelText: 'Enter Number',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    }),
                TextFormField(
                    onSaved: (value) => setState(
                          () => _register.useraddress = value,
                        ),
                    decoration: InputDecoration(
                      labelText: 'Enter Address',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Name';
                      }
                      return null;
                    }),
                ElevatedButton(
                    onPressed: () {
                      // _register = Register(username: names);
                      // _reHelp.insertRegister(_register);
                      _sub();
                    },
                    child: Text('Submit'))
              ],
            ),
          ),
        ));
  }

  _sub() async {
    var form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();
      await _reHelp.insertRegister(_register);
      print('is what $_register ');
      form.reset();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => (UserHomeScreen())));
    }
  }
}
