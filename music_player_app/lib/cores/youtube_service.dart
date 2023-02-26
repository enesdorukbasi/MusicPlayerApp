import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:music_player_app/models/channel_info.dart';
import 'package:music_player_app/models/result.dart';
import 'package:music_player_app/models/search_musics.dart';
import 'package:music_player_app/utils/constants.dart';

class YoutubeServices {
  // ignore: constant_identifier_names
  static const channel_id = "UC5lbdURzjB0irr-FTbjWN1A";
  static const _baseUrl = 'www.googleapis.com';

  static Future<ChannelInfo> getChannelInfo() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': channel_id,
      'key': Constants.youtube_api_key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };
    Uri uri = Uri.https(_baseUrl, '/youtube/v3/channels', parameters);
    Response response = await http.get(uri, headers: headers);

    ChannelInfo channelInfo = channelInfoFromJson(response.body);
    return channelInfo;
  }

  static Future<SearchMusics> getSearchMusics(String searchingText) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'q': searchingText,
      'maxResults': '500',
      'type': 'video',
      'videoCategoryId': '10',
      'key': Constants.youtube_api_key,
    };
    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    Uri uri = Uri.https(_baseUrl, '/youtube/v3/search', parameters);
    Response response = await http.get(uri, headers: headers);
    SearchMusics musics = searchMusicsFromJson(response.body);

    return musics;
  }

  static Future<MusicDownloadInfoResult> getMusicInfoApi(String url) async {
    String apiUrl =
        'https://api.akuari.my.id/downloader/youtube3?link=${url.toString()}&type=360';
    final response = await http.get(Uri.parse(apiUrl));

    var object = jsonDecode(response.body);

    http.delete(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      return MusicDownloadInfoResult.fromJson(object);
    } else {
      throw Exception('Failed to load url');
    }
  }
}
