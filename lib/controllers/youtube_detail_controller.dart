import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtuble_clone/controllers/video_controller.dart';
import 'package:youtuble_clone/models/youtuber.dart';

class YoutubeDetailController extends GetxController {
  VideoController videoController;
  YoutubePlayerController playerController;
  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters["videoId"]);
    playerController = YoutubePlayerController(
      initialVideoId: Get.parameters["videoId"],
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.onInit();
  }

  String get title => videoController.video.snippet.title;
  String get viewCount => "์กฐํ์ ${videoController.statistics.value.viewCount}ํ";
  String get publishedTime => DateFormat("yyyy-MM-dd")
      .format(videoController.video.snippet.publishTime);
  String get description => videoController.video.snippet.description;
  String get likeCount => "${videoController.statistics.value.likeCount}";
  String get dislikeCount => "${videoController.statistics.value.dislikeCount}";
  String get youtuberThumbnailUrl => videoController.youtuberThumbnailUrl;
  String get youtuberName => videoController.youtuber.value.snippet.title;
}
