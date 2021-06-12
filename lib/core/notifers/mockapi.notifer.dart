import 'dart:convert';
import 'dart:io';

import 'package:baseapp/core/api/mockapi.dart';
import 'package:flutter/material.dart';

class MockAPINotifier extends ChangeNotifier {
  /*Instance of my MockApi class */
  final MockAPI _mockAPI = new MockAPI();
  List _posts = [];
  List get posts => _posts;

  Future getData() async {
    try {
      _mockAPI.getData().then((value) async {
        final List parsedData = await jsonDecode(value.toString());
        _posts = parsedData;
        print(posts);
        notifyListeners();
      });
    }
    // on SocketException {}
/*Also give socket expection whwen no use of internet */
    catch (error) {
      print(error);
    }
  }

  Future getDataById({required String id}) async {
    try {
      _mockAPI.getDataById(id: id);
    }
    // on SocketException {}
    catch (error) {
      print(error);
    }
  }

  Future postData(
      {required String id, required String title, required String body}) async {
    try {
      _mockAPI.postData(title: title, body: body, id: id);
    }
    // on SocketException {}
    catch (error) {
      print(error);
    }
  }

  Future updateData({required String id, required String title}) async {
    try {
      _mockAPI.updateData(title: title, id: id);
    }
    // on SocketException {}
    catch (error) {
      print(error);
    }
  }

  Future deleteData({required String id, required String title}) async {
    try {
      _mockAPI.deleteData(id: id);
    }
    // on SocketException {}
    catch (error) {
      print(error);
    }
  }
}
