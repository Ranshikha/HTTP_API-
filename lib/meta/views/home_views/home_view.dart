import 'package:baseapp/core/notifers/cache.notifier.dart';
import 'package:baseapp/core/notifers/mockapi.notifer.dart';
import 'package:baseapp/meta/views/list_data/list_data.view.dart';
import 'package:baseapp/meta/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*Rest Api will be sending entire data
Graph ql will sending the particular data only 
Graph ql is the fast in terms of performance */
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final idController = TextEditingController();
    final bodyController = TextEditingController();
    /*Variable for rendering our button*/
    var _mockApiNotifier = Provider.of<MockAPINotifier>(context, listen: false);
    return Scaffold(
        /*For converting the raw json data into a list */
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ListDataView()));
            },
            child: Icon(Icons.arrow_circle_up)),
        appBar: AppBar(
          title: Text("Home View"),
        ),
        body: Center(
          /*ButtonBar is the list of entire button */
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter title"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(hintText: "Enter body"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: idController,
                decoration: InputDecoration(hintText: "Enter id"),
              ),
              SizedBox(height: 10),
              ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    child: Text('GET'),
                    onPressed: () {
                      _mockApiNotifier.getData();
                    },
                    color: Colors.blue,
                  ),
                  MaterialButton(
                      child: Text('GET BY ID'),
                      onPressed: () {
                        _mockApiNotifier.getDataById(id: idController.text);
                      },
                      color: Colors.yellowAccent),
                  MaterialButton(
                    child: Text('POST'),
                    onPressed: () {
                      _mockApiNotifier.postData(
                          id: idController.text,
                          title: titleController.text,
                          body: bodyController.text);
                    },
                    color: Colors.green,
                  ),
                  MaterialButton(
                    child: Text('UPDATE'),
                    onPressed: () {
                      _mockApiNotifier.updateData(
                        id: idController.text,
                        title: titleController.text,
                      );
                    },
                    color: Colors.orange,
                  ),
                  MaterialButton(
                    child: Text('DELETE'),
                    /*Getting empty data and a status code of 200  */
                    onPressed: () {
                      _mockApiNotifier.deleteData(
                        id: idController.text,
                        title: titleController.text,
                      );
                    },
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
