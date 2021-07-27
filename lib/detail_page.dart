import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networking_app/home_binding.dart';

import 'album.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Album album = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('${album.id}'),
            Text(album.title),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
