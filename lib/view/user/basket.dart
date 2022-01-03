import 'package:app_jul/controller/homecontroller.dart';
import 'package:app_jul/view/user/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter/rendering.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:app_jul/utilites/database_helper.dart';

import 'buy.dart';

class basket extends StatefulWidget {
  basket({Key? key}) : super(key: key);

  @override
  _basketState createState() => _basketState();
}

class _basketState extends State<basket> {
  homecontroller controller = Get.find();
  final dbHelper = DatabaseHelper.instance;

  List notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Basket"),
          actions: [
            IconButton(
                onPressed: () async {
                  controller.deleteAllBas();
                  controller.query();
                },
                icon: Icon(Icons.delete_sweep_sharp))
          ],
          elevation: 0.0,
        ),
        body: GetBuilder<homecontroller>(
            init: homecontroller(),
            builder: (controller) => Container(
                  child: Container(
                    child: ListView.builder(
                      itemCount: controller.add_to_basket.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                            key: Key("$index"),
                            child: ListNote(
                                notes: controller.add_to_basket[index]));
                      },
                    ),
                  ),
                )));
  }
}

class ListNote extends StatefulWidget {
  final notes;
  ListNote({Key? key, this.notes}) : super(key: key);

  get id => null;

  @override
  _ListNoteState createState() => _ListNoteState();
}

class _ListNoteState extends State<ListNote> {
  final dbHelper = DatabaseHelper.instance;

  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) => Row(
        children: [
          Expanded(
            flex: 8,
            child: InkWell(
              child: Card(
                child: ListTile(
                  title: Text(
                    "${widget.notes["name"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text("${widget.notes["price_total"]}"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      counter++;
                    });
                  },
                  icon: Icon(Icons.add))),
          Expanded(
              flex: 1,
              child: Text(
                '$counter',
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    if (counter > 1) {
                      setState(() {
                        counter--;
                      });
                    }
                    // _update();
                    // _update(counter);
                  },
                  icon: Icon(Icons.remove))),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () async {
                  print('${widget.notes["_id"]}');
                  print('${widget.notes["name"]}');
                  print(widget.notes["price_product"]);
                  print(counter);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => buProduct(
                          id: '${widget.notes["_id"]}',
                          name: '${widget.notes["name"]}',
                          count: counter,
                          price_product: widget.notes["price_product"]),
                    ),
                  );
                },
                icon: Icon(Icons.check_circle),
                color: Colors.green,
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () async {
                  controller.id_basket = widget.notes["_id"];
                  controller.deleteBas();
                  controller.query();
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
/*
class ListNote1 extends StatelessWidget {
  final notes;

  final dbHelper = DatabaseHelper.instance;
  ListNote({this.notes});
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
      init: homecontroller(),
      builder: (controller) => Row(
        children: [
          Expanded(
            flex: 8,
            child: InkWell(
              child: Card(
                child: ListTile(
                  title: Text(
                    "${notes["name"]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text("count: ${notes["count"]}"),
                  trailing: Text("${notes["price_total"]}"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    counter++;
                    // _update(counter);
                    // _update();
                  },
                  icon: Icon(Icons.add))),
          Expanded(
              flex: 1,
              child: Text(
                '$counter',
                textAlign: TextAlign.center,
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                  onPressed: () {
                    counter--;
                    // _update();
                    // _update(counter);
                  },
                  icon: Icon(Icons.remove))),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () async {
                  controller.id_basket = notes["_id"];
                  controller.deleteBas();
                  controller.query();
                },
                icon: Icon(Icons.check_circle),
                color: Colors.green,
              )),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () async {
                  controller.id_basket = notes["_id"];
                  controller.deleteBas();
                  controller.query();
                },
                icon: Icon(Icons.delete),
                color: Colors.red,
              )),
        ],
      ),
    );
  }
}
*/