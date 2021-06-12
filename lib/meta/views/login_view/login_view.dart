import 'package:baseapp/core/notifers/cache.notifier.dart';
import 'package:baseapp/meta/views/home_views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final passwordController = TextEditingController();
    var _cacheNotifer = Provider.of<CacheNotifer>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Login View'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "Enter Name"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "Enter Password "),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.blue,
                child: Text("Login"),
                onPressed: () {
                  /*here I need some cache which has some key and the value
                  Now we have the cache so we must move to our homeview
                   */
                  _cacheNotifer
                      .writeCache(key: "login", value: passwordController.text)
                      .whenComplete(() {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeView()));
                  });
                }),
          ],
        )));
  }
}
