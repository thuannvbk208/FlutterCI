import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking_app/home_binding.dart';
import 'home_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  /*
    Add comment to learn workflow
  */
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => HomePage(), binding: HomeBinding())
      ],
      initialRoute: '/',
    );
  }
}
