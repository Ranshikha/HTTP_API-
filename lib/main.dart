import 'package:baseapp/app/providers/providers.dart';
import 'package:baseapp/meta/views/home_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: HomeView(),
          debugShowCheckedModeBanner: false,
        ),
        providers: provider);
  }
}
