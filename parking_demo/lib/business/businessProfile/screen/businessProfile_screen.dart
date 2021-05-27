import 'package:flutter/material.dart';
import 'package:parking_demo/business/businessProfile/provider/businessProfile_provider.dart';

import 'package:provider/provider.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({Key key}) : super(key: key);

  @override
  _BusinessProfileScreenState createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  @override
  void initState() {
    Provider.of<BusinessProfileProvider>(context, listen: false).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<BusinessProfileProvider>(
          builder: (context, model, child) {
            return model.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(':'),
                            Text(
                              model.businessProfileData.name != null
                                  ? model.businessProfileData.name
                                  : '',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Address:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              model.businessProfileData.address != null
                                  ? model.businessProfileData.address
                                  : '',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Motor Number:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              model.businessProfileData.businessType != null
                                  ? model.businessProfileData.businessType
                                  : '',
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Email:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              model.businessProfileData.email != null
                                  ? model.businessProfileData.email
                                  : '',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
