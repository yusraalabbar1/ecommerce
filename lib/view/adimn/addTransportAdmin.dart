import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:app_jul/view/user/home.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class admin extends StatefulWidget {
  admin({Key? key}) : super(key: key);

  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  var name;
  var type;
  var note;
  var price;
  FocusNode myFocusNode = new FocusNode();
  PickedFile? imageFile = null;
  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  Future uploaImage() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      final uri = Uri.parse('http://10.0.2.2/transport2/upload.php');
      var request = http.MultipartRequest('POST', uri);
      request.fields['name'] = name;
      request.fields['price'] = price;
      request.fields['note'] = note;
      request.fields['type'] = type;

      var pic = await http.MultipartFile.fromPath("image", imageFile!.path);
      request.files.add(pic);
      var response = await request.send();

      if (response.statusCode == 200) {
        print("Image upload");
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
      } else {
        print("Image Not upload");
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ADD TRANSPORT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            // fontFamily: 'Mukta',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.panorama_vertical_select_outlined,
                              color: Color(0xff27A2BB),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1, color: Color(0xff27A2BB))),
                            labelText: "inter transport name ",
                            labelStyle: TextStyle(
                                color: myFocusNode.hasFocus
                                    ? Color(0xffFAB10C)
                                    : Colors.black),
                            fillColor: Colors.white,
                            hoverColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff27A2BB), width: 1.5))),
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
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.emoji_transportation,
                            color: Color(0xff27A2BB),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xff27A2BB))),
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color(0xffFAB10C)
                                  : Colors.black),
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff27A2BB), width: 1.5)),
                          labelText: "inter type for transport  ",
                        ),
                        // autovalidateMode: AutovalidateMode.always,

                        onSaved: (string) {
                          type = string;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.price_change,
                            color: Color(0xff27A2BB),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xff27A2BB))),
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color(0xffFAB10C)
                                  : Colors.black),
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff27A2BB), width: 1.5)),
                          labelText: "inter price transport ",
                        ),
                        // autovalidateMode: AutovalidateMode.always,

                        onSaved: (string) {
                          price = string;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.note,
                            color: Color(0xff27A2BB),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Color(0xff27A2BB))),
                          labelStyle: TextStyle(
                              color: myFocusNode.hasFocus
                                  ? Color(0xffFAB10C)
                                  : Colors.black),
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff27A2BB), width: 1.5)),
                          labelText: "inter note for transport  ",
                        ),
                        // autovalidateMode: AutovalidateMode.always,

                        onSaved: (string) {
                          note = string;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Card(
                      child: (imageFile == null)
                          ? Text("Choose Image")
                          : Image.file(File(imageFile!.path)),
                    ),
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      _showChoiceDialog(context);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    label: Text(
                      'Select Image',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                    textColor: Colors.white,
                    color: Color(0xffFAB10C),
                  ),
                ],
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              elevation: 10,
              splashColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              onPressed: uploaImage,
              child: Text("add transport informatin"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.orange),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.orange,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.orange,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.orange,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
