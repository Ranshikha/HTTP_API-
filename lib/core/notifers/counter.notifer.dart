import 'package:flutter/material.dart';

/*ChangeNotifer is the bse of entire app */
class CounterNotifer extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  /*Here we are using getters because reading the data it is good habbit to read the with getters,
  Here we are refering the _counter varible by counter */
  void increament() {
    _counter++;
    notifyListeners();
  }
/*Declaring the methods under Provider as ChangeNotifer we must have to mention the notifyListener like the setState of the local data 
Without the notifyListeners the following data will not be updated.
 */
/*Use changeNotiferprovider which is the connector between the consumer & notifers.  */
}
