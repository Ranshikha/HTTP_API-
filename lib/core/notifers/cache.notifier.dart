import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheNotifer extends ChangeNotifier {
/*SharePereference Instances */
  /*WriteCache:1. Taking a key and a value, create instances of shared preferences
  after creating instance we will use the setString for user password and the provided arguments.
   and then nofitying all the listener*/
/*ReadCache: We need only singel argument for reading the data
   We can store the key in a variable then also return the var.
   Here we will get the string so use getString*/
/*DeleteCache: It also need only one parameter ,
&  remove the particular string passed by argument
 */
/*Partical Example: Suppose we are Login to Instagram 
so it will store some Token or cache in the database 
if Cache will match then u will be redirected to HomeScreen
otherwise u will be again come to LoginScreen 
if u will click on Logout button the credential shall be removed from cache 
Cache can store & load data even if u r offline*/
//Now we need as sign the cache to change notifer provider

//Add the method type as future we will try to retrive the data
  Future writeCache({required String key, required String value}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
    notifyListeners();
  }

  Future readCache({required String key}) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var cache = sharedPreferences.getString(key);
    notifyListeners();
    return cache;
  }

  Future deleteCache({
    required String key,
  }) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.remove(
      key,
    );
    notifyListeners();
  }
}
