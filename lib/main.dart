import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtuble_clone/binding/init_binding.dart';
import 'package:youtuble_clone/controllers/youtube_detail_controller.dart';
import 'package:youtuble_clone/screens/youtube_detail.dart';
import 'package:youtuble_clone/src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Youtube Clone App',
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: InitBinding(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(
            name: "/detail/:videoId",
            page: () => YoutubeDetail(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeDetailController>(
                () => YoutubeDetailController()))),
      ],
    );
  }
}
