import 'package:get/get.dart';
import 'package:youtuble_clone/controllers/app_controller.dart';
import 'package:youtuble_clone/repository/youtube_repository.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(YoutubeRepository(), permanent: true);
    Get.put(AppController());
  }
}
