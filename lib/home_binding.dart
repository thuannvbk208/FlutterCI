import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:networking_app/album.dart';
import 'package:networking_app/services.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Services service = Get.put(Services());
    Get.put(HomeController(service));
  }
}

class HomeController extends GetxController with StateMixin<List<Album>> {
  final Services  provider;
  HomeController(this.provider);
  // var isLoading = false.obs;
  // List<Album> albums = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await provider.fetchAlbums().then((response) {
        if (response.hasError) {
          change(null, status: RxStatus.error(response.statusText));
        } else {
            final json = jsonDecode(response.bodyString ?? '').cast<Map<String, dynamic>>();
            List<Album> albums = json.map<Album>((subJson) => Album.fromJson(subJson)).toList();
            if (albums.isEmpty) {
              change(null, status: RxStatus.empty());
            } else {
              change(albums, status: RxStatus.success());
            }
        }
    }, onError: (err) {
       change(null, status: RxStatus.error(err.toString()));
    });
  }

}