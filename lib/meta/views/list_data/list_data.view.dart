import 'package:baseapp/core/notifers/mockapi.notifer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ListDataView extends StatefulWidget {
  const ListDataView({Key? key}) : super(key: key);

  @override
  _ListDataViewState createState() => _ListDataViewState();
}

class _ListDataViewState extends State<ListDataView> {
  @override
  void initState() {
    Provider.of<MockAPINotifier>(context, listen: false).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _mockApiNotifier = Provider.of<MockAPINotifier>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text("List Data View"),
        ),
        body: Container(
            child: FutureBuilder(
                future: _mockApiNotifier.getData(),
                builder: (
                  context,
                  snapshot,
                ) {
                  if (

                      // _mockApiNotifier.posts == null ||
                      _mockApiNotifier.posts.isEmpty) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: _mockApiNotifier.posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(
                              _mockApiNotifier.posts[index]['id'].toString()),
                        ),
                        title: Text(
                            _mockApiNotifier.posts[index]['title'].toString()),
                        subtitle: Text(
                            _mockApiNotifier.posts[index]['body'].toString()),
                      );
                    },
                  );
                })));
  }
}
