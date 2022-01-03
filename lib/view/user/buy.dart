import 'package:app_jul/Services/payment.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class buProduct extends StatefulWidget {
  final name;
  final id;
  final count;
  final price_product;

  buProduct({Key? key, this.id, this.name, this.count, this.price_product})
      : super(key: key);

  @override
  _buProductState createState() => _buProductState();
}

class _buProductState extends State<buProduct> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var name;
  var phone;
  var addreesR;
  var partement;
  var country;
  var postal;
  var numCard;
  var nameCard;
  var ExpDate;
  var secCode;

  @override
  void initState() {
    super.initState();
    StripeServices.init();
  }

  void payNow() async {
    //the amount must be transformed to cents
    var response =
        await StripeServices.payNowHandler(amount: '1000', currency: 'USD');
    print('response message ${response.message}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Form(
            key: formstate,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Enter your information:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.panorama_vertical_select_outlined,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter your name "),
                    // autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text!.length > 20) {
                        return "can not enter bigest than 15";
                      }
                      if (text.length < 1) {
                        return "can not enter less than 1";
                      }
                      return null;
                    },
                    onSaved: (string) {
                      name = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.mobile_friendly,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter number mobile "),
                    // autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text!.length > 20) {
                        return "can not enter bigest than 15";
                      }
                      if (text.length < 1) {
                        return "can not enter less than 1";
                      }
                      return null;
                    },
                    onSaved: (string) {
                      phone = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.panorama_vertical_select_outlined,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter your address "),
                    // autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text!.length > 20) {
                        return "can not enter bigest than 15";
                      }
                      if (text.length < 1) {
                        return "can not enter less than 1";
                      }
                      return null;
                    },
                    onSaved: (string) {
                      addreesR = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.home,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter your name partement "),
                    // autovalidateMode: AutovalidateMode.always,
                    validator: (text) {
                      if (text!.length > 20) {
                        return "can not enter bigest than 15";
                      }
                      if (text.length < 1) {
                        return "can not enter less than 1";
                      }
                      return null;
                    },
                    onSaved: (string) {
                      partement = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.code_outlined,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter your name partement "),
                    // autovalidateMode: AutovalidateMode.always,

                    onSaved: (string) {
                      postal = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Enter your information card:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  /*TextFormField(
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.code_outlined,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter card number "),
                    // autovalidateMode: AutovalidateMode.always,

                    onSaved: (string) {
                      numCard = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),*/
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter your name card "),
                    // autovalidateMode: AutovalidateMode.always,

                    onSaved: (string) {
                      nameCard = string;
                    },
                  ),
                  /*  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,

                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.date_range,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter Expiration date "),
                    // autovalidateMode: AutovalidateMode.always,

                    onSaved: (string) {
                      ExpDate = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),*/
                  /*  TextFormField(
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.security,
                          color: Color(0xff27A2BB),
                        ),
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xff27A2BB))),
                        labelText: "inter security code "),
                    // autovalidateMode: AutovalidateMode.always,

                    onSaved: (string) {
                      secCode = string;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),*/
                  RaisedButton(
                    onPressed: () {
                      payNow();
                    },
                    child: Text("Buy NOW"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
