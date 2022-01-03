import 'package:app_jul/utilites/database_helper.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//GetBuilder
class homecontroller extends GetxController {
  // int counter = 1;
  var name;
  var id;
  var id_basket;
  var color;
  var price;
  List transport = [];
  List add_to_basket = [];
  final dbHelper = DatabaseHelper.instance;
  int counter = 1;

  void incremental(int c) {
    counter = c;
    counter++;
    print(counter);
    update();
  }

  void decremental(int c) {
    counter = c;
    if (counter > 1) {
      counter--;
      update();
    }
  }

  Future getNots() async {
    var url = Uri.parse('http://10.0.2.2/transport2/index.php');
    var respose = await http.get(url);
    var responsebody = jsonDecode(respose.body);
    print(responsebody);
    transport.addAll(responsebody);
    update();
    print(transport);
  }

  void queryBas() async {
    final allRows = await dbHelper.queryAllRows();
    add_to_basket.addAll(allRows);
    update();

    print("************************");
    print(add_to_basket);
    print("************************");
  }

  void delet() async {
    var data = {
      "id": id,
    };
    var url = Uri.parse('http://10.0.2.2/transport2/deletTransport.php');
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    print(responsebody);
    transport = [];
    update();

    return responsebody;
  }

  void deleteBas() async {
    final rowsDeleted = await dbHelper.delete(id_basket);
    print('deleted $rowsDeleted row(s): row $id');
    add_to_basket = [];
    update();
  }

  void deleteAllBas() async {
    final rowsDeleted = await dbHelper.drop();
    print('deleted table');
    add_to_basket = [];
    update();
  }

  void query() async {
    final allRows = await dbHelper.queryAllRows();
    add_to_basket = [];
    add_to_basket.addAll(allRows);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getNots();
    queryBas();
  }

  @override
  void onReady() {
    super.onReady();
  }
}



/*

//Getx   and   obx
class homecontroller extends GetxController {
  
  RxInt counter = 0.obs;
  void incremental() {
    counter++;
  }

  void decremental() {
    counter--;
  }
}


*/

/*
class homecontroller extends GetxController {
  int counter = 0;
  late List add_to_basket = [];

  List add_to_list(var element) {
    add_to_basket.add(element);
    return add_to_basket;
  }

  void incremental() {
    counter++;
    update();
  }

  void decremental() {
    counter--;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("init home controller");
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    print("ready home controller");
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print("close home controller");
    super.onClose();
  }
}*/
