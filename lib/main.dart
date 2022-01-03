import 'package:app_jul/view/adimn/AllTransport.dart';
import 'package:app_jul/view/adimn/addTransportAdmin.dart';
import 'package:app_jul/view/adimn/chois.dart';
import 'package:app_jul/view/adimn/editePageAdmin.dart';
import 'package:app_jul/view/adimn/mainPageAdmin.dart';
import 'package:app_jul/view/user/basket.dart';
import 'package:app_jul/view/user/buy.dart';
import 'package:app_jul/view/user/detailsBuy.dart';
import 'package:app_jul/view/user/home.dart';
import 'package:app_jul/view/user/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'ch_ad_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ch_ad_us(),
      theme: ThemeData(
          //33539E • 7FACD6 • BFB8DA • E8B7D4 • A5678E

          primaryColor: Color(0xff27A2BB),
          buttonColor: Color(0xff27A2BB),
          fontFamily: 'Mukta',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
              headline6: TextStyle(
            fontSize: 15,
            color: Colors.blue,
            fontFamily: 'PatuaOne',
          ))),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/home", page: () => home()),
        GetPage(name: "/basket", page: () => basket()),
        GetPage(
            name: "/product",
            page: () => product(
                  name: '',
                  note: '',
                  salary: '',
                  photo_name: '',
                )),
        GetPage(
            name: "/buy",
            page: () => buy(
                  id: '',
                  name: '',
                  note: '',
                  salary: '',
                  photo_name: '',
                )),
        GetPage(name: "/ch_ad_us", page: () => buy()),
        GetPage(name: "/admin", page: () => admin()),
        GetPage(
            name: "/editPageAdmin",
            page: () => editPageAdmin(
                  id: '',
                  name: '',
                  type: '',
                  price: '',
                  note: '',
                )),
        GetPage(name: "/mainPageAdmin", page: () => mainPageAdmin()),
        GetPage(name: "/chois", page: () => chois()),
        GetPage(name: "/AllTransport", page: () => AllTransport()),
        GetPage(
            name: "/buProduct",
            page: () =>
                buProduct(id: '', name: '', count: '', price_product: '')),
      ],
    );
  }
}
