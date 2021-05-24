import 'package:youtuble_clone/models/video.dart';

class YoutubeVideoResult {
  int toalResults;
  int resultsPerPage;
  String nextPagetoken;
  List<Video> items;

  YoutubeVideoResult(
      {this.toalResults, this.resultsPerPage, this.nextPagetoken, this.items});
  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
        toalResults: json['pageInfo']['totalResults'],
        resultsPerPage: json['pageInfo']['resultsPerPage'],
        nextPagetoken: json['nextPageToken'] ?? "",
        items:
            List<Video>.from(json["items"].map((data) => Video.fromJson(data))),
      );
}
