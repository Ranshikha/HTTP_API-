import 'dart:async';

import 'package:baseapp/core/notifers/cache.notifier.dart';
import 'package:baseapp/meta/views/home_views/home_view.dart';
import 'package:baseapp/meta/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  /* Init is used to initalizze once the following screen is ready
  */
  @override
  void initState() {
    /*call my cache notifer 
    first call the instance of cache Notifer as read*/
    var _cacheNotifer = Provider.of<CacheNotifer>(context, listen: false);
//Add the method type as future we will try to retrive the data,'value' is cache read variable
    _cacheNotifer.readCache(key: "login").then((value) {
      if (value != null) {
        /*Timer will have too take duration and callback with help Navigator */
        return Timer(
            Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeView())));
      } else {
        return Timer(
            Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => LoginView())));
      }
    });
    // print("Flutter Bootcamp");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Icon(Icons.pages, size: 100),
    ));
  }
}
