import 'package:mobx/mobx.dart';
import 'package:music_player_app/cores/local_db_services/local_db_music_service.dart';
import 'package:music_player_app/cores/local_db_services/local_db_playlist_service.dart';
import 'package:music_player_app/models/playlist.dart';

part 'playlist_list_page_view_model.g.dart';

class PlaylistListPageViewModel = PlaylistListPageViewModelBase
    with _$PlaylistListPageViewModel;

abstract class PlaylistListPageViewModelBase with Store {
  @computed
  int get getCount => _count;
  @computed
  List<Playlist> get getPlaylists => playlists;

  @observable
  int _count = 0;
  @observable
  List<Playlist> playlists = [];

  Future<void> getCountAllMusics() async {
    _count = await LocalDbMusicService().getCountDownloadedMusics();
  }

  Future<void> getAllPlaylists() async {
    playlists = await LocalDbPlaylistService().getAllPlaylists();
  }

  Future<void> createPlaylist(String playlistName) async {
    await LocalDbPlaylistService().addPlaylist(playlist_name: playlistName);
    await getAllPlaylists();
  }
}
