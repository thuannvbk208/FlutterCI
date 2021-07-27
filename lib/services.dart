import 'dart:convert';

import 'package:get/get.dart';
import 'package:networking_app/album.dart';

class Services extends GetConnect {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    httpClient.timeout = Duration(seconds: 10);
    httpClient.baseUrl = 'https://jsonplaceholder.typicode.com';
    httpClient.maxAuthRetries = 3;
    httpClient.defaultDecoder = (val) {
      List<Album> albums = val.map<Album>((subJson) => Album.fromJson(subJson)).toList();
      return albums;
    };
  }

  Future<Response> fetchAlbums() {
    return get('/albums');
  }
}