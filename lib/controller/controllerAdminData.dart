import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class controllerAdminData extends GetxController {
  late var id;

  void deletDtaAdmin() async {
    var data = {
      "id": "$id",
    };
    var url = Uri.parse('http://10.0.2.2/transport2/deletTransport.php');
    var response = await http.post(url, body: data);
    var responsebody = jsonDecode(response.body);

    print(responsebody);
    update();
    return responsebody;
  }
}
