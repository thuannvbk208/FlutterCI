import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:networking_app/detail_page.dart';
import 'package:networking_app/home_binding.dart';
import 'album.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Github Action'),
      ),
      body: controller.obx(
              (state) => ListView.builder(
                itemCount: state?.length,
                itemBuilder: (context, index) {
                  Album album = state!.elementAt(index);
                  return InkWell(
                    onTap: () {
                      Get.to(() => DetailPage(), arguments: album);
                    },
                    child: ListTile(
                      title: Text('${album.id}',
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(album.title),
                    ),
                  );
                }
              ),
          onError: (error) {
            return Text(error ?? '');
          },
          onLoading: Center(child: CircularProgressIndicator()),
          onEmpty: Text('Empty'))
    );
  }

}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     HomeController _controller = Get.find();
//     return Obx(() {
//       return LoadingOverlay(
//           color: Colors.black,
//           opacity: 0.3,
//           isLoading: _controller.isLoading.value,
//           child: Scaffold(
//             body: ListView.builder(
//                 itemCount: _controller.albums.length,
//                 itemBuilder: (context, index) {
//                   Album album = _controller.albums.elementAt(index);
//                   return InkWell(
//                     onTap: () {
//                       Get.to(() => DetailPage(), arguments: album);
//                     },
//                     child: ListTile(
//                       title: Text('${album.id}', style: TextStyle(fontWeight: FontWeight.bold),),
//                       subtitle: Text(album.title),
//                     ),
//                   );
//                 }
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 _controller.isLoading.value = true;
//                 Future.delayed(Duration(seconds: 3), () {
//                   _controller.albums = [];
//                   _controller.isLoading.value = false;
//                 });
//               },
//               child: Icon(Icons.refresh),
//             ),
//           )
//       );
//     });
//   }
// }
