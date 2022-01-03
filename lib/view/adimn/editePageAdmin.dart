import 'package:app_jul/controller/homecontroller.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class editPageAdmin extends StatefulWidget {
  final id;
  final name;
  final note;
  final price;
  final type;
  final image;
  editPageAdmin(
      {Key? key,
      this.id,
      this.name,
      this.note,
      this.type,
      this.price,
      this.image})
      : super(key: key);
  @override
  _editPageAdminState createState() => _editPageAdminState();
}

class _editPageAdminState extends State<editPageAdmin> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var name;
  var note;
  var price;
  var type;
  homecontroller c = new homecontroller();

  update() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      var data = {
        "id": "${widget.id}",
        "name": "$name",
        "type": " $type",
        "note": " $note",
        "price": " $price",
      };
      var url = Uri.parse('http://10.0.2.2/transport2/upateTransport.php');

      var response = await http.post(url, body: data);
      var responsebody = jsonDecode(response.body);
      print(responsebody);
      AwesomeDialog(
          context: context,
          dialogType: DialogType.SUCCES,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'succes',
          desc: 'Informaton is true',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.green)
        ..show();
      return responsebody;
    } else {
      print("not valid");
      AwesomeDialog(
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.RIGHSLIDE,
          headerAnimationLoop: true,
          title: 'Error',
          desc: 'Informaton is false',
          btnOkOnPress: () {},
          btnOkIcon: Icons.cancel,
          btnOkColor: Colors.red)
        ..show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => Scaffold(
              appBar: AppBar(title: Text('EDITTING')),
              body: ListView(children: [
                Container(
                  child: Column(
                    children: [
                      Center(
                          child: Container(
                              height: 200,
                              width: 200,
                              child: Image.network(
                                  "http://10.0.2.2/transport2/upload/${widget.image}"))),
                      Form(
                          key: formstate,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: "${widget.name}",
                                decoration: InputDecoration(
                                    // labelText: "${notes[2]["subject"]}",
                                    labelText: "subject",
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(Icons.car_rental)),
                                validator: (text) {
                                  if (text!.length > 30) {
                                    return "can not enter bigest than 30";
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
                              TextFormField(
                                minLines: 1,
                                maxLines: 10,
                                initialValue: "${widget.note}",
                                decoration: InputDecoration(
                                    // labelText: "${notes[1]["text"]}",
                                    labelText: "note",
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(Icons.note)),
                                validator: (text) {
                                  if (text!.length < 1) {
                                    return "can not enter less than 1";
                                  }
                                  return null;
                                },
                                onSaved: (string) {
                                  note = string;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                minLines: 1,
                                maxLines: 10,
                                initialValue: "${widget.price}",
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    // labelText: "${notes[1]["text"]}",
                                    labelText: "price",
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(Icons.price_change)),
                                validator: (text) {
                                  if (text!.length < 1) {
                                    return "can not enter less than 1";
                                  }
                                  return null;
                                },
                                onSaved: (string) {
                                  price = string;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                minLines: 1,
                                maxLines: 10,
                                initialValue: "${widget.type}",
                                decoration: InputDecoration(
                                    // labelText: "${notes[1]["text"]}",
                                    labelText: "type",
                                    filled: true,
                                    fillColor: Colors.white,
                                    suffixIcon: Icon(Icons.merge_type)),
                                validator: (text) {
                                  if (text!.length < 1) {
                                    return "can not enter less than 1";
                                  }
                                  return null;
                                },
                                onSaved: (string) {
                                  type = string;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 10),
                                onPressed: update,
                                child: Text(
                                  "update note",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ]),
            ));
  }
}
