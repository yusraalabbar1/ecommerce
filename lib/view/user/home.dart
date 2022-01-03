import 'dart:convert';
import 'package:app_jul/controller/homecontroller.dart';
import 'package:app_jul/utilites/database_helper.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:app_jul/view/user/basket.dart';
import 'package:app_jul/view/user/product.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  homecontroller controller = Get.put(homecontroller(), permanent: true);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  var search;
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  final dbHelper = DatabaseHelper.instance;

  homecontroller controller = Get.find();

  int numberTab = 1;
  List listAllTransport = [];
  List listCarTransport = [];
  List listBusTransport = [];
  List listPicTransport = [];
  List _foundAll = [];
  List _foundCar = [];
  List _foundBus = [];
  List _foundPic = [];
  List favorite = [];
  void _runFilter(String enteredKeyword, int c) {
    List results = [];
    if (c == 1) {
      if (enteredKeyword.isEmpty) {
        results = listAllTransport;
      } else {
        results = listAllTransport
            .where((user) => user["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }

      setState(() {
        _foundAll = results;
      });
    } else if (c == 2) {
      if (enteredKeyword.isEmpty) {
        results = listBusTransport;
      } else {
        results = listBusTransport
            .where((user) => user["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }

      setState(() {
        _foundBus = results;
      });
    } else if (c == 3) {
      if (enteredKeyword.isEmpty) {
        results = listPicTransport;
      } else {
        results = listPicTransport
            .where((user) => user["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }

      setState(() {
        _foundPic = results;
      });
    } else if (c == 4) {
      if (enteredKeyword.isEmpty) {
        results = listCarTransport;
      } else {
        results = listCarTransport
            .where((user) => user["name"]
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
      }

      setState(() {
        _foundCar = results;
      });
    }
  }

  Future allTransport() async {
    var url =
        Uri.parse('http://10.0.2.2/transport2/returnInformatinByType.php');

    var respose = await http.get(url);
    var responsebody = jsonDecode(respose.body);
    print(responsebody);
    setState(() {
      listAllTransport.addAll(responsebody);
    });
    _foundAll = listAllTransport;
    print(listAllTransport);
  }

  transportCar() async {
    var data = {
      "type": "car",
    };
    var url = Uri.parse('http://10.0.2.2/transport2/returnCar.php');
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    setState(() {
      listCarTransport.addAll(responsebody);
    });
    _foundCar = listCarTransport;
    return responsebody;
  }

  transportBus() async {
    var data = {
      "type": "bus",
    };
    var url = Uri.parse('http://10.0.2.2/transport2/returnBus.php');
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    setState(() {
      listBusTransport.addAll(responsebody);
    });
    _foundBus = listBusTransport;
    return responsebody;
  }

  transportbyc() async {
    var data = {
      "type": "byc",
    };
    var url = Uri.parse('http://10.0.2.2/transport2/returnByc.php');
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    setState(() {
      listPicTransport.addAll(responsebody);
    });
    _foundPic = listPicTransport;
    return responsebody;
  }

  @override
  void initState() {
    super.initState();
    allTransport();
    transportCar();
    transportBus();
    transportbyc();
  }

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => basket());
            },
            child: Icon(Icons.shopping_cart),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            toolbarHeight: 240,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "TRANSPORT Collections",
                    style: TextStyle(
                      color: Color(0xff117C6F),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // fontFamily: 'Mukta',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "The best of transport collections, all in one place.",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: Form(
                          key: formstate,
                          child: TextFormField(
                            onTap: () {},
                            onChanged: (value) => _runFilter(value, numberTab),
                            decoration: InputDecoration(
                              fillColor: Colors.grey[100],
                              filled: true,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 0.0)),
                              labelText: "search ",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              focusColor: Colors.orange,
                              hoverColor: Colors.orange,
                            ),
                            // autovalidateMode: AutovalidateMode.always,
                            validator: (text) {
                              if (text!.length < 1) {
                                return "can not enter less than 5";
                              }
                              return null;
                            },
                            onSaved: (string) {
                              search = string;
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin:
                              EdgeInsets.only(top: 20, left: 10, bottom: 10),
                          // color: Colors.black12,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25))),
                          child: IconButton(
                              color: Color(0xff289C8E),
                              iconSize: 30,
                              onPressed: () {},
                              icon: Icon(Icons.menu))),
                    )
                  ],
                ),
                TabBar(
                  // labelPadding: EdgeInsets.all(5),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                      // Creates border

                      color: Color(0xffB2F0E8)),
                  tabs: [
                    InkWell(
                      onTap: () {
                        numberTab = 1;
                      },
                      child: Tab(
                        icon: Icon(
                          Icons.all_inclusive,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        numberTab = 2;
                      },
                      child: Tab(
                          icon: Icon(
                        Icons.directions_transit,
                        color: Colors.black,
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        numberTab = 3;
                      },
                      child: Tab(
                          icon: Icon(
                        Icons.directions_bike,
                        color: Colors.black,
                      )),
                    ),
                    InkWell(
                      onTap: () {
                        numberTab = 4;
                      },
                      child: Tab(
                          icon: Icon(
                        Icons.directions_car,
                        color: Colors.black,
                      )),
                    )
                  ],
                ),
              ],
            ),
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   currentIndex: selected,
          //   selectedItemColor: Colors.orange,
          //   unselectedItemColor: Colors.black,
          //   onTap: (index) {
          //     setState(() {
          //       selected = index;
          //     });
          //   },
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "one"),
          //     BottomNavigationBarItem(icon: Icon(Icons.reviews), label: "tow"),
          //     BottomNavigationBarItem(icon: Icon(Icons.star), label: "three"),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "four"),
          //   ],
          // ),
          body: TabBarView(
            children: [
              allTab(_foundAll),
              allTab(_foundBus),
              allTab(_foundPic),
              allTab(_foundCar),
            ],
          ),
        ));
  }

  ListView allTab(List name_list) {
    return ListView.builder(
      itemCount: name_list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => product(
                  id: '${name_list[index]['id']}',
                  name: '${name_list[index]['name']}',
                  note: '${name_list[index]['note']}',
                  salary: name_list[index]['price'],
                  photo_name: '${name_list[index]['image']}',
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            padding: EdgeInsets.all(20),
            height: 200,
            decoration: BoxDecoration(
                // color: Colors.pink[50],
                color: (int.parse(name_list[index]['id']).isEven)
                    ? Color(0xffA8DEE0)
                    : Color(0xffF9E2AE),
                borderRadius: BorderRadius.all(Radius.circular(60))),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        "http://10.0.2.2/transport2/upload/${name_list[index]['image']}",
                        fit: BoxFit.fill,
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.shopping_basket,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => product(
                                        id: '${name_list[index]['id']}',
                                        name: '${name_list[index]['name']}',
                                        note: '${name_list[index]['note']}',
                                        salary: name_list[index]['price'],
                                        photo_name:
                                            '${name_list[index]['image']}',
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            FavoriteButton(
                              iconColor: Colors.red,
                              iconDisabledColor: Colors.white,
                              iconSize: 40,
                              valueChanged: (_isFavorite) {
                                print('Is Favorite $_isFavorite)');
                              },
                            )

                            // )
                          ],
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              "${name_list[index]['name']}",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "${name_list[index]['note']}",
                              style: TextStyle(fontSize: 15),
                            )),
                        Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(top: 10, left: 20),
                            child: Text(
                              "${name_list[index]['price']}\$",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2F3579),
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
