import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:mobx/mobx.dart';
import 'package:music_player_app/cores/local_db_services/local_db_music_in_playlist_service.dart';
import 'package:music_player_app/cores/shared_preferences/music_player_preferences.dart';
import 'package:music_player_app/models/music.dart';

part 'music_player_bottom_sheet_view_model.g.dart';

class MusicPlayerBottomSheetViewModel = MusicPlayerBottomSheetViewModelBase
    with _$MusicPlayerBottomSheetViewModel;

abstract class MusicPlayerBottomSheetViewModelBase with Store {
  @computed
  bool get getBottomSheetIsActive => bottomSheetIsActive;
  @computed
  bool get getBottomSheetIsOpen => bottomSheetIsOpen;
  @computed
  int get getTabbarSelectedIndex => _tabbarSelectedIndex;
  @computed
  List<Music> get getPlaylistInMusics => _musics;
  @computed
  int get getActiveMusicId => _activeMusicId;
  @computed
  int get getActivePlaylistId => _activePlaylistId;
  @computed
  bool get isPlayTrue => isPlay;
  @computed
  Duration get getDuration => duration;
  @computed
  Duration get getPosition => position;

//
//

  @observable
  bool bottomSheetIsActive = false;
  @observable
  bool bottomSheetIsOpen = false;
  @observable
  int _tabbarSelectedIndex = 0;
  @observable
  List<Music> _musics = [];
  @observable
  int _activeMusicId = 0;
  @observable
  int _activePlaylistId = 0;
  @observable
  bool isPlay = false;
  @observable
  Duration duration = Duration.zero;
  @observable
  Duration position = Duration.zero;

//

  final AudioPlayer audioPlayer = AudioPlayer();

//
//

  changeBottomSheetIsOpened() {
    bottomSheetIsOpen = !bottomSheetIsOpen;
  }

  initialProcess() async {
    List<Object?> values = await MusicPlayerPreferences().getPreferences();
    if (values[0].toString().toLowerCase() == "true") {
      bottomSheetIsActive = true;
    } else {
      bottomSheetIsActive = false;
    }
    _activeMusicId = int.parse(values[1].toString());
    _activePlaylistId = int.parse(values[2].toString());
    await takeMusicLists();
  }

  deletePreferences() async {
    MusicPlayerPreferences().deletePreferences(bottomSheetIsActive: false);
  }

  changeTabbarIndex(int index) {
    _tabbarSelectedIndex = index;
  }

  takeMusicLists() async {
    _musics = await LocalDbMusicInPlaylistService()
        .getAllMusicByPlaylistsId(_activePlaylistId - 1);
  }

  changeActiveMusic(int activeMusicId) {
    _activeMusicId = activeMusicId;
    MusicPlayerPreferences().setMusicIdPreferences(activeMusicId);
  }

  changePlayingMusic(Music music, int activeMusicIndex) {
    _activeMusicId = activeMusicIndex;
    MusicPlayerPreferences().setMusicIdPreferences(activeMusicIndex);
    stopSong();
    playSong(music, activeMusicIndex);
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

  playSong(Music music, int musicIndex) {
    try {
      audioPlayer.setAudioSource(
        AudioSource.uri(
          Uri.parse(music.music_path),
          tag: MediaItem(
            id: musicIndex.toString(),
            title: music.music_name,
          ),
        ),
      );

      audioPlayer.play();
      isPlay = true;
      changeActiveMusic(musicIndex);
      // ignore: empty_catches
    } on Exception {}
  }

  stopSong() {
    try {
      audioPlayer.stop();
      // ignore: empty_catches
    } on Exception {}
  }

  resumeSong() {
    audioPlayer.play();
  }

  pauseSong() {
    audioPlayer.pause();
  }

  backgroundTaskEntrypoint() {}
}
