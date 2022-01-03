import 'package:app_jul/controller/homecontroller.dart';
import 'package:app_jul/utilites/database_helper.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter/rendering.dart';

import 'basket.dart';
import 'detailsBuy.dart';

class product extends StatefulWidget {
  final name;
  final note;
  final salary;
  final photo_name;
  final id;
  homecontroller controller = Get.put(homecontroller(), permanent: true);
  product(
      {Key? key, this.name, this.note, this.salary, this.photo_name, this.id})
      : super(key: key);

  @override
  _productState createState() => _productState();
}

class _productState extends State<product> {
  var r1 = 20.0;
  var r2 = 20.0;
  var r3 = 20.0;
  var r4 = 20.0;
  var r5 = 20.0;
  var r6 = 23.0;
  var pikcolor = "141715";

  homecontroller controller = Get.find();

  final dbHelper = DatabaseHelper.instance;
  void insertBus() async {
    int counter = 1;
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "${widget.name}".toString(),
      DatabaseHelper.color: pikcolor,
      DatabaseHelper.date: formatter,
      DatabaseHelper.count: 1,
      DatabaseHelper.number_product: counter,
      DatabaseHelper.price_delivary: 2500,
      DatabaseHelper.price_product: int.parse(widget.salary),
      DatabaseHelper.price_total: int.parse(widget.salary) * counter + 2500
    };
    print(int.parse(widget.salary) * counter + 2500);

    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    AwesomeDialog(
        context: context,
        animType: AnimType.LEFTSLIDE,
        headerAnimationLoop: false,
        dialogType: DialogType.SUCCES,
        showCloseIcon: true,
        title: 'Succes',
        desc: 'add to basket shopping',
        btnOkOnPress: () {
          debugPrint('OnClcik');
        },
        btnOkIcon: Icons.check_circle,
        onDissmissCallback: (type) {
          debugPrint('Dialog Dissmiss from callback $type');
        })
      ..show();

    // update();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => Scaffold(
            appBar: AppBar(
              actions: [
                Row(
                  children: [
                    Text("${controller.add_to_basket.length}"),
                    IconButton(
                        onPressed: () {
                          Get.to(() => basket());
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.orange,
                          size: 30,
                        )),
                  ],
                )
              ],
              elevation: 0.0,
              // backgroundColor: Colors.pink[50],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                insertBus();
                controller.query();
              },
              child: Icon(Icons.shopping_basket),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: ListView(
              children: [
                Container(
                  child: Image.network(
                      "http://10.0.2.2/transport2/upload/${widget.photo_name}",
                      fit: BoxFit.fill),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20, bottom: 1),
                  child: Text(
                    "A New Piece Calld a ${widget.name}",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20, bottom: 20),
                      child: Text(
                        "New Piece, The price: ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Text("${widget.note}"),
                    Container(
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          "${widget.salary} \$",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        )),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    "Select Color ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: r1,
                        backgroundColor: Colors.red,
                      ),
                      onTap: () {
                        setState(() {
                          pikcolor = "F42d2d";
                          r1 = 23.0;
                          r2 = 20.0;
                          r3 = 20.0;
                          r4 = 20.0;
                          r5 = 20.0;
                          r6 = 20.0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: r2,
                        backgroundColor: Colors.pink,
                      ),
                      onTap: () {
                        setState(() {
                          pikcolor = "F4008a";
                          r1 = 20.0;
                          r2 = 23.0;
                          r3 = 20.0;
                          r4 = 20.0;
                          r5 = 20.0;
                          r6 = 20.0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: r3,
                        backgroundColor: Colors.grey,
                      ),
                      onTap: () {
                        setState(() {
                          pikcolor = "8f878c";
                          r1 = 20.0;
                          r2 = 20.0;
                          r3 = 23.0;
                          r4 = 20.0;
                          r5 = 20.0;
                          r6 = 20.0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: r4,
                        backgroundColor: Colors.blue,
                      ),
                      onTap: () {
                        setState(() {
                          pikcolor = "1c7fe1";
                          r1 = 20.0;
                          r2 = 20.0;
                          r3 = 20.0;
                          r4 = 23.0;
                          r5 = 20.0;
                          r6 = 20.0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: r5,
                        backgroundColor: Colors.green,
                      ),
                      onTap: () {
                        setState(() {
                          pikcolor = "31b84d";
                          r1 = 20.0;
                          r2 = 20.0;
                          r3 = 20.0;
                          r4 = 20.0;
                          r5 = 23.0;
                          r6 = 20.0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      child: CircleAvatar(
                        radius: r6,
                        backgroundColor: Colors.black,
                      ),
                      onTap: () {
                        setState(() {
                          pikcolor = "141715";
                          r1 = 20.0;
                          r2 = 20.0;
                          r3 = 20.0;
                          r4 = 20.0;
                          r5 = 20.0;
                          r6 = 23.0;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 20),
                  child: Text(
                    "Description ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    "New Piece, Excellnt quality iron ,${widget.note}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Text("${widget.photo_name}"),
              ],
            )));
  }
}
