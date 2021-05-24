import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:youtuble_clone/models/statistics.dart';
import 'package:youtuble_clone/models/video.dart';
import 'package:youtuble_clone/models/youtuber.dart';
import 'package:youtuble_clone/repository/youtube_repository.dart';

class VideoController extends GetxController {
  Video video;

  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(this.video.id.videoId);

    statistics(loadStatistics);
    Youtuber loadyoutuber = await YoutubeRepository.to
        .getYoutuberInfoById(this.video.snippet.channelId);

    youtuber(loadyoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount} 회";
  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null) {
      return "https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png";
    }
    return youtuber.value.snippet.thumbnails.medium.url;
  }
}
