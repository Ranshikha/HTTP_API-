import 'dart:convert';

import 'package:baseapp/app/routes/api_routes.dart';
import 'package:http/http.dart' as http;

class MockAPI {
  /*Here we creating the 'client' for 'http' by help of 'Client' class
  create the methods */
  final client = http.Client();
  //@GET METHOD
  Future getData() async {
    print("Fetching data");
/*Always put a slash (/) because to append suburl with the baseUrl */
    final subUrl = "/posts";
/*Create a Uri which will give abstract class by dart for parsing the Uri*/
    final Uri uri = Uri.parse(BASEURL + subUrl);
    /*Get method will requiring Url and Some headers, Headers are type request and response for service api */
    final http.Response response = await client.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      return response.body;
      // print(response.body);
    }
  } //@GET METHOD by ID

  Future getDataById({required String id}) async {
    /*To give the Id dynamically provide argument and then append it */
    print("Fetching data by ID");
/*Always put a slash (/) because to append suburl with the baseUrl */
    final subUrl = "/posts/$id";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.get(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    if (response.statusCode == 200) {
      print(response.body);
    }
  }

//@POST Method
  Future postData(
      {required String id, required String title, required String body}) async {
    print("Posting data by ID");
/* append suburl with the baseUrl no 'id' is needed */
    final subUrl = "/posts";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    /*Post method will requiring Url ,body and Some headers, Headers are type request and response for service api */
    final http.Response response = await client.post(uri,
        body: jsonEncode({"title": title, "body": body, "userId": id}),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        });
/*Sometime when we don't receive due to different status code */
    // if (response.statusCode == 200) {
    print(response.body);
    // }
  }

  //@UPDATE Method
  Future updateData({
    required String id,
    required String title,
  }) async {
    print("Updating data");
    final subUrl = "/posts/$id";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.patch(uri,
        body: jsonEncode({
          "title": title,
        }),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        });
    print(response.body);
    print(response.statusCode);
  } //@DELETE Method

  Future deleteData({
    required String id,
  }) async {
    print("Deleting data");
    final subUrl = "/posts/$id";
    final Uri uri = Uri.parse(BASEURL + subUrl);
    final http.Response response = await client.delete(uri, headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
    print(response.body);
    print(response.statusCode);
  }
}
