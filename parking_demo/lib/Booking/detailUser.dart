import 'package:flutter/material.dart';
import 'package:parking_demo/Booking/employee.dart';
import 'package:parking_demo/Booking/helper.dart';

class DetailUser extends StatefulWidget {
  const DetailUser({Key key}) : super(key: key);

  @override
  _DetailUserState createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  List<Register> _registers = [];
  DatabaseHelpering _getdbHelper;
  @override
  void initState() {
    super.initState();
    setState(() {
      _getdbHelper = DatabaseHelpering.instance;
      print(' xi $_registers');
    });
    _refresh();
    print('is call again');
  }

  _refresh() async {
    List<Register> a = await _getdbHelper.fetchRegister();
    setState(() {
      _registers = a;
    });
    print('yes$_registers');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('User Status'),
            Expanded(
              child: Card(
                // margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Number is: ${_registers[index].id}'),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Name is: ${_registers[index].username}'),
                                ),
                                Text(
                                    'Number is: ${_registers[index].usernumber}'),
                                Text(
                                    'Address is: ${_registers[index].useraddress}'),
                              ]),
                        ),
                        Divider(
                          height: 5,
                        )
                      ],
                    );
                  },
                  itemCount: _registers.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // _refresh() async {
  //   List<Register> a = await _getdbHelper.fetchRegister();
  //   setState(() {
  //     _registers = a;
  //   });
  //   print('yes$_registers');
  // }
}
