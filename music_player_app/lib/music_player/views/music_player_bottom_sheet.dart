// ignore_for_file: must_be_immutable, unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player_app/downloaded_musics/widgets/music_item.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:music_player_app/music_player/views/music_player_home_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MusicPlayerBottomSheet extends StatelessWidget {
  MusicPlayerBottomSheet({super.key});

  SolidController solidController = SolidController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  playSong(String? uri) {
    try {
      _audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
      // ignore: empty_catches
    } on Exception {}
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    viewmodel.initialProcess();

    viewmodel.audioPlayer.durationStream.listen((event) {
      if (event != null) viewmodel.duration = event;
    });

    viewmodel.audioPlayer.positionStream.listen((event) {
      if (event != null) viewmodel.position = event;
    });

    return SolidBottomSheet(
      controller: solidController,
      toggleVisibilityOnTap: true,
      draggableBody: true,
      minHeight: 0,
      maxHeight: MediaQuery.of(context).size.height - 20.h,
      onShow: () {
        viewmodel.initialProcess();
        viewmodel.changeBottomSheetIsOpened();
      },
      onHide: () {
        viewmodel.initialProcess();
        viewmodel.changeBottomSheetIsOpened();
      },
      headerBar: Observer(
        builder: (_) {
          return viewmodel.getBottomSheetIsOpen
              ? Container(
                  color: Colors.orange.shade400,
                  height: 8.h,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 25.sp,
                  ),
                )
              : Container(
                  color: Colors.orange.shade400,
                  height: 8.h,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            if (solidController.isOpened) {
                              solidController.hide();
                            } else {
                              solidController.show();
                            }
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: 7.h,
                                width: 7.h,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.music_note,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.px),
                              SizedBox(
                                width: 41.w,
                                child: Text(
                                  viewmodel.getPlaylistInMusics.isEmpty
                                      ? ""
                                      : viewmodel
                                          .getPlaylistInMusics[
                                              viewmodel.getActiveMusicId]
                                          .music_name
                                          .substring(
                                          0,
                                          viewmodel
                                                  .getPlaylistInMusics[viewmodel
                                                      .getActiveMusicId]
                                                  .music_name
                                                  .length -
                                              4,
                                        ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                viewmodel.deletePreferences();
                                viewmodel.stopSong();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => viewmodel.onPlayPressed(),
                              icon: Icon(
                                viewmodel.isPlayTrue
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () => viewmodel.changePlayingMusic(
                                  viewmodel.getPlaylistInMusics[
                                      viewmodel.getActiveMusicId + 1],
                                  viewmodel.getActiveMusicId + 1),
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
      body: Container(
        color: Colors.white,
        height: 30,
        child: ListView(
          children: [
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TabBar(
                    onTap: (value) {
                      viewmodel.changeTabbarIndex(value);
                    },
                    labelColor: Colors.orange,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: 'Oynatılıyor',
                      ),
                      Tab(
                        text: 'Çalma Listesi',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Observer(
              builder: (_) {
                if (viewmodel.getTabbarSelectedIndex == 0) {
                  return const MusicPlayerHomePage();
                } else {
                  return SizedBox(
                    height: 75.h,
                    child: ListView.builder(
                      itemCount: viewmodel.getPlaylistInMusics.length,
                      itemBuilder: (context, index) {
                        return MusicItemDownloaded(
                          music: viewmodel.getPlaylistInMusics[index],
                          playlistId: 0,
                          musicIndex: index,
                          isPlayer: true,
                          viewModel1:
                              Provider.of<MusicPlayerBottomSheetViewModel>(
                                  context,
                                  listen: true),
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
