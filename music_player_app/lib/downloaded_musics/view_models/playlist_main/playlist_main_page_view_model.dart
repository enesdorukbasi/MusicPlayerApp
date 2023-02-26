import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:music_player_app/cores/local_db_services/local_db_music_in_playlist_service.dart';
import 'package:music_player_app/cores/local_db_services/local_db_music_service.dart';
import 'package:music_player_app/cores/local_db_services/local_db_playlist_service.dart';
import 'package:music_player_app/cores/shared_preferences/music_player_preferences.dart';
import 'package:music_player_app/models/music.dart';
import 'package:music_player_app/models/playlist.dart';

part 'playlist_main_page_view_model.g.dart';

class PlaylistMainPageViewModel = PlaylistMainPageViewModelBase
    with _$PlaylistMainPageViewModel;

abstract class PlaylistMainPageViewModelBase with Store {
  @computed
  List<Music> get getMusics => _musics;
  @computed
  List<Playlist> get getPlaylists => playlists;

  @observable
  List<Music> _musics = [];
  @observable
  List<Playlist> playlists = [];

  Future<void> getAllMusics() async {
    _musics = await LocalDbMusicService().getAllDownloadedMusics();
  }

  Future<void> getAllPlaylists() async {
    playlists = await LocalDbPlaylistService().getAllPlaylists();
  }

  Future<void> getAllMusicsByPlaylistId(int id) async {
    _musics =
        await LocalDbMusicInPlaylistService().getAllMusicByPlaylistsId(id);
  }

  Future<void> addMusicInPlaylist(int musicId, int playlistId) async {
    await LocalDbMusicInPlaylistService()
        .addMusicInPlaylist(music_id: musicId, playlist_id: playlistId);
  }

  Future<void> deleteMusicInPlaylist(int musicId, int playlistId) async {
    await LocalDbMusicInPlaylistService()
        .deleteMusicInPlaylist(musicId, playlistId);
    await getAllMusicsByPlaylistId(playlistId);
  }

  Future<void> deleteMusic(Music music) async {
    await LocalDbMusicService().deleteMusic(music.id);
    await getAllMusics();
    File file = File.fromUri(Uri.file(music.music_path));
    file.delete();
  }

  Future<void> setMusicPlaylistPreferences(
      {required int playlistId, required int musicIndex}) async {
    await MusicPlayerPreferences().setPreferences(true, musicIndex, playlistId);
  }
}
