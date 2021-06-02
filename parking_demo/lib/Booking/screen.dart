import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parking_demo/Booking/employee.dart';
import 'package:parking_demo/Booking/helper.dart';

import 'package:parking_demo/userprofile/userscreenBar.dart';

class Screen extends StatefulWidget {
  Screen({Key key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Contact _contact = Contact(); //insert call
  List<Contact> _contacts = []; //fetch call
  DatabaseHelpering _dbHelper; //calling database

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelpering.instance;
    });
    _refresh();
    print('is call');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[_form(), Text('Booking Status'), list()],
        ),
      ),
    );
  }

  _form() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                onSaved: (value) => setState(() => _contact.name = value),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Name';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              TextFormField(
                  onSaved: (value) => setState(() => _contact.number = value),
                  decoration: InputDecoration(
                    labelText: 'Vehicle Number',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Vehicle Number';
                    }
                    return null;
                  }),
              TextFormField(
                  onSaved: (value) => setState(() => _contact.address = value),
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Vehicle Number';
                    }
                    return null;
                  }),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                    onPressed: () {
                      _submit();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (UserHomeScreen())));
                      Fluttertoast.showToast(
                          msg: "Booking Succesfully",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.amber,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Text('Submit')),
              )
            ],
          ),
        ),
      );
  _refresh() async {
    List<Contact> x = await _dbHelper.fetchContact();
    setState(() {
      _contacts = x;
    });
    print('yes$_contacts');
  }

  _submit() async {
    var form = _formKey.currentState;
    if (_formKey.currentState.validate()) {
      form.save();
      await _dbHelper.insertContact(_contact);

      form.reset();
    }
  }

  list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(_contacts[index].name.toUpperCase()),
                        Text(_contacts[index].number),
                        Text(_contacts[index].address),
                      ],
                    ),
                  ),
                  Divider(
                    height: 5,
                  )
                ],
              );
            },
            itemCount: _contacts.length,
          ),
        ),
      );
}
