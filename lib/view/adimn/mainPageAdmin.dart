import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'addTransportAdmin.dart';
import 'chois.dart';

class mainPageAdmin extends StatefulWidget {
  mainPageAdmin({Key? key}) : super(key: key);

  @override
  _mainPageAdminState createState() => _mainPageAdminState();
}

class _mainPageAdminState extends State<mainPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Admin",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // fontFamily: 'Mukta',
            ),
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 50,
              child: FlatButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: new Text(
                  'admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Mukta',
                  ),
                ),
                onPressed: () {
                  Get.to(() => chois());
                },
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 50,
              child: FlatButton(
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: new Text(
                  'user',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Mukta',
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("editPageAdmin");
                },
              ),
            ),
          ),
        ]));
  }
}
