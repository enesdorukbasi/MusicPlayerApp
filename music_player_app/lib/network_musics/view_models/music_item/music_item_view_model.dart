// ignore_for_file: unused_local_variable, depend_on_referenced_packages

import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mobx/mobx.dart';
import 'package:music_player_app/cores/local_db_services/local_db_music_service.dart';
import 'package:music_player_app/cores/youtube_service.dart';
import 'package:music_player_app/models/music.dart';
import 'package:music_player_app/models/result.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'music_item_view_model.g.dart';

class MusicItemViewModel = MusicItemViewModelBase with _$MusicItemViewModel;

abstract class MusicItemViewModelBase with Store {
  final Dio dio = Dio();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @computed
  bool get getIsDownloadedMusic => isDownloaded;
  @computed
  bool get getIsDownloading => isDownloading;
  @computed
  String get getProgress => _progress;
  @computed
  List<Music> get getAllMusics => _musics;
  @computed
  bool get isPlayTrue => isPlay;
  @computed
  Duration get getDuration => duration;
  @computed
  Duration get getPosition => position;
  @computed
  MusicDownloadInfoResult get getInfoResult => infoResult!;

  @observable
  bool isDownloaded = false;
  @observable
  bool isDownloading = false;
  @observable
  String _progress = "-";
  @observable
  List<Music> _musics = [];
  @observable
  bool isPlay = false;
  @observable
  Duration duration = Duration.zero;
  @observable
  Duration position = Duration.zero;
  @observable
  MusicDownloadInfoResult? infoResult;

  final AudioPlayer audioPlayer = AudioPlayer();

  Future<void> getMusicInfoApiConnect(String videoId, String musicName) async {
    String videoUrl = 'https://www.youtube.com/watch?v=$videoId';
    infoResult = await YoutubeServices.getMusicInfoApi(videoUrl);
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();
    const initSettings = InitializationSettings(android: android, iOS: iOS);

    flutterLocalNotificationsPlugin.initialize(initSettings);

    await getDownloadedMusics();
  }

  Future<void> getDownloadedMusics() async {
    _musics = await LocalDbMusicService().getAllDownloadedMusics();
  }

  fileControl(String videoId) {
    bool music = getAllMusics.any((element) => element.music_id == videoId);

    isDownloaded = music;
  }

  Future<void> downloadMusic(
      String downloadLink, String musicName, String musicId) async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      isDownloading = true;
      final baseStorage = await getExternalStorageDirectory();
      final savePath = path.join(baseStorage!.path, musicName);
      await _startDownload(downloadLink, savePath, musicName, musicId);
      isDownloading = false;
      fileControl(musicId);
    }
  }

  Future<void> _startDownload(
      String url, String savePath, String musicName, String musicId) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await dio.download(
        url,
        savePath,
        onReceiveProgress: _onReceiveProgress,
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      LocalDbMusicService().addMusic(
          music_name: musicName, music_path: savePath, music_id: musicId);
      await _showNotification(result);
    }
  }

  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      _progress = "${(received / total * 100).toStringAsFixed(0)}%";
    }
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    if (Platform.isAndroid) {}
    const android = AndroidNotificationDetails(
        'channel id', 'channel name', 'channel description',
        priority: Priority.high, importance: Importance.max);
    const iOS = IOSNotificationDetails();
    const platform = NotificationDetails(android: android, iOS: iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
      0, // notification id
      isSuccess ? 'Success' : 'Failure',
      isSuccess ? 'Müzik başarıyla indirildi!' : 'İndirme başarısız oldu!',
      platform,
      payload: json,
    );
  }

  @action
  void onPlayPressed() {
    isPlay = !isPlay;
    if (isPlay) {
      resumeSong();
    } else {
      pauseSong();
    }
  }

  playSong(String videoId) async {
    try {
      String videoUrl = 'https://www.youtube.com/watch?v=$videoId';
      // audioPlayer.setUrl(videoUrl);
      await audioPlayer.setUrl(infoResult!.audio.audio);
      // audioPlayer.play();
      // isPlay = true;
      // ignore: empty_catches
    } on Exception {}
  }

  stopSong() {
    try {
      audioPlayer.stop();
      isPlay = false;
      // ignore: empty_catches
    } on Exception {}
  }

  resumeSong() {
    audioPlayer.play();
    isPlay = true;
  }

  pauseSong() {
    audioPlayer.pause();
    isPlay = false;
  }
}
