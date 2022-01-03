import 'package:app_jul/view/adimn/AllTransport.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'addTransportAdmin.dart';

class chois extends StatefulWidget {
  chois({Key? key}) : super(key: key);

  @override
  _choisState createState() => _choisState();
}

class _choisState extends State<chois> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TRANSPORT Shopping",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontFamily: 'Mukta',
          ),
        ),
      ),
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //FAB10C • F4B076 • 27A2BB • D6D6D6 • 85BFCD
          Container(
            child: Image.asset(
              "images/admin2.png",
              fit: BoxFit.fill,
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              width: 150,
              height: 50,
              child: FlatButton(
                color: Color(0xffFAB10C),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: new Text(
                  'ADD transport',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Mukta',
                  ),
                ),
                onPressed: () {
                  Get.to(() => admin());
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
                color: Color(0xffF4B076),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: new Text(
                  'EDIT transport',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Mukta',
                  ),
                ),
                onPressed: () {
                  Get.to(() => AllTransport());
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
                color: Color(0xff27A2BB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                child: new Text(
                  'DELET',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'Mukta',
                  ),
                ),
                onPressed: () {
                  Get.to(() => AllTransport());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
