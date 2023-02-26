import 'package:mobx/mobx.dart';
import 'package:music_player_app/cores/local_db_services/local_db_music_in_playlist_service.dart';
import 'package:music_player_app/cores/local_db_services/local_db_playlist_service.dart';
import 'package:music_player_app/downloaded_musics/view_models/playlist_list/playlist_list_page_view_model.dart';
part 'playlist_item_view_model.g.dart';

class PlaylistItemViewModel = PlaylistItemViewModelBase
    with _$PlaylistItemViewModel;

abstract class PlaylistItemViewModelBase with Store {
  @computed
  int get getMusicCount => _musicCount;

  @observable
  int _musicCount = 0;

  Future<void> getCountAllMusics(int playlistId) async {
    _musicCount = await LocalDbMusicInPlaylistService()
        .getCountDownloadedMusics(playlistId);
  }

  Future<void> deletePlaylist(int playlistId) async {
    await LocalDbPlaylistService().deletePlaylist(playlistId);
    PlaylistListPageViewModel().getAllPlaylists();
  }
}
