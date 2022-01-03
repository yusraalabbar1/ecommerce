import 'package:app_jul/view/adimn/addTransportAdmin.dart';
import 'package:app_jul/view/adimn/chois.dart';
import 'package:app_jul/view/adimn/mainPageAdmin.dart';
import 'package:app_jul/view/user/home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class ch_ad_us extends StatefulWidget {
  ch_ad_us({Key? key}) : super(key: key);

  @override
  _ch_ad_usState createState() => _ch_ad_usState();
}

class _ch_ad_usState extends State<ch_ad_us> {
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
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => chois());
              },
              icon: Icon(
                Icons.admin_panel_settings,
                color: Colors.white,
                size: 30,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset("images/green.png", fit: BoxFit.fill),
            ),
            Container(
              child: Image.asset("images/airtime.png", fit: BoxFit.fill),
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
                    'Let\'s GO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Mukta',
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed("home");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
