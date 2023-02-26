// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_player_app/downloaded_musics/view_models/playlist_main/playlist_main_page_view_model.dart';
import 'package:music_player_app/downloaded_musics/widgets/music_item.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';

class PlaylistMainPage extends StatelessWidget {
  int? playlistId;
  String playlistTitle;
  MusicPlayerBottomSheetViewModel musicPlayerBottomSheetViewModel;
  PlaylistMainPage(
      {super.key,
      required this.playlistId,
      required this.playlistTitle,
      required this.musicPlayerBottomSheetViewModel});

  final _viewModel = PlaylistMainPageViewModel();

  @override
  Widget build(BuildContext context) {
    if (playlistId == null) {
      _viewModel.getAllMusics();
    } else {
      _viewModel.getAllMusicsByPlaylistId(playlistId! - 1);
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(playlistTitle),
      ),
      body: Observer(
        builder: (_) {
          if (_viewModel.getMusics.isNotEmpty) {
            return ListView.builder(
              itemCount: _viewModel.getMusics.length,
              itemBuilder: (context, index) {
                return MusicItemDownloaded(
                  music: _viewModel.getMusics[index],
                  playlistId: playlistId,
                  musicIndex: index,
                  isPlayer: false,
                  viewModel1: musicPlayerBottomSheetViewModel,
                );
              },
            );
          } else {
            return const Center(
              child: Text("Bu listeye henüz müzik eklenmemiş."),
            );
          }
        },
      ),
    );
  }
}
