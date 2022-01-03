import 'package:app_jul/controller/homecontroller.dart';
import 'package:app_jul/utilites/database_helper.dart';
import 'package:app_jul/view/user/basket.dart';
import 'package:app_jul/view/user/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter/rendering.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class buy extends StatefulWidget {
  final name;
  final note;
  final salary;
  final photo_name;
  final color;
  final id;
  homecontroller controller = Get.put(homecontroller(), permanent: true);
  buy(
      {Key? key,
      this.id,
      this.name,
      this.note,
      this.salary,
      this.photo_name,
      this.color})
      : super(key: key);

  @override
  _buyState createState() => _buyState();
}

class _buyState extends State<buy> {
  int counter = 1;
  final dbHelper = DatabaseHelper.instance;
  homecontroller controller = Get.find();

  void insertBus() async {
    // row to insert
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: "${widget.name}".toString(),
      DatabaseHelper.color: "${widget.color}",
      DatabaseHelper.date: formatter,
      DatabaseHelper.count: counter,
      DatabaseHelper.number_product: counter,
      DatabaseHelper.price_delivary: 2500,
      DatabaseHelper.price_product: int.parse(widget.salary),
      DatabaseHelper.price_total: int.parse(widget.salary) * counter + 2500
    };
    print(int.parse(widget.salary) * counter + 2500);
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
    // update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  Get.to(() => basket());
                },
                icon: Icon(
                  Icons.shopping_basket,
                  color: Colors.orange,
                  size: 30,
                )),
          ],
          elevation: 0.0,
          // backgroundColor: Colors.white,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            insertBus();
            controller.query();
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
          },
          child: Icon(Icons.shopping_cart_rounded),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: ListView(
          children: [
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
                      "${widget.salary}\$",
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
                  // color: Color(),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    print("${widget.color}");
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      backgroundColor: Color(int.parse("0xff${widget.color}")),
                    ),
                  ),
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
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "New Piece, Excellnt quality iron ,${widget.note}",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Container(
            //   margin: EdgeInsets.only(left: 20, bottom: 20),
            //   child: Text(
            //     "Select Count ",
            //     style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.black,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 20.0,
            //     ),
            //     CircleAvatar(
            //       radius: 20,
            //       backgroundColor: Colors.pink,
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.add,
            //           color: Colors.white,
            //         ),
            //         onPressed: () {
            //           setState(() {
            //             counter++;
            //           });
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     Container(
            //         child: Text(
            //       "$counter",
            //       style: TextStyle(
            //         fontSize: 20,
            //         color: Colors.black,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )),
            //     SizedBox(
            //       width: 10.0,
            //     ),
            //     CircleAvatar(
            //       radius: 20,
            //       backgroundColor: Colors.pink,
            //       child: IconButton(
            //         icon: Icon(
            //           Icons.remove,
            //           color: Colors.white,
            //         ),
            //         onPressed: () {
            //           if (counter > 1) {
            //             setState(() {
            //               counter--;
            //             });
            //           }
            //         },
            //       ),
            //     ),

            //     // )
            //   ],
            // ),

            Container(
              margin: EdgeInsets.only(left: 20, bottom: 20),
              child: Text(
                "Select Country and city ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  items: [
                    "Senegal",
                    "D-Italia (Disabled)",
                    "D-Tunisia (Disabled)",
                    'D-Canada (Disabled)'
                  ],
                  label: "Menu mode",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('D'),
                  onChanged: print,
                  selectedItem: "Senegal"),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  items: ["Dakar", "Kolda", "Louga", 'Thies'],
                  label: "Menu mode",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "Dakar"),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                "Details ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "home delivery:",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, bottom: 5),
                  child: Text(
                    "2500 FCFA ",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
