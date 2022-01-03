import 'package:app_jul/controller/homecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'editePageAdmin.dart';

class AllTransport extends StatefulWidget {
  AllTransport({Key? key}) : super(key: key);

  @override
  _AllTransportState createState() => _AllTransportState();
}

class _AllTransportState extends State<AllTransport> {
  @override
  Widget build(BuildContext context) {
    double mdw = MediaQuery.of(context).size.width;
    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => Container(
              child: Scaffold(
                appBar: AppBar(
                  title: Text("MY Transport"),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("admin");
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                body: Container(
                  child: Container(
                    child: ListView.builder(
                      itemCount: controller.transport.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                            key: Key("$index"),
                            child: ListNote(
                                transport: controller.transport[index]));
                        //return ListNote(notes: notes[index]);
                      },
                    ),
                  ),
                ),
              ),
            ));
  }
}

class ListNote extends StatelessWidget {
  final transport;

  ListNote({this.transport});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homecontroller>(
        init: homecontroller(),
        builder: (controller) => Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Image.network(
                        "http://10.0.2.2/transport2/upload/${transport['image']}",
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => editPageAdmin(
                              id: '${transport["id"]}',
                              name: '${transport["name"]}',
                              note: '${transport["note"]}',
                              price: '${transport["price"]}',
                              type: '${transport["type"]}',
                              image: '${transport['image']}'),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          "${transport["name"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${transport["price"]}"),
                        trailing: IconButton(
                          onPressed: () async {
                            controller.id = '${transport["id"]}';
                            controller.delet();
                            controller.getNots();
                          },
                          icon: Icon(Icons.delete),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ));
  }
}
