// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:music_player_app/downloaded_musics/view_models/playlist_main/playlist_main_page_view_model.dart';
import 'package:music_player_app/models/music.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MusicItemDownloaded extends StatelessWidget {
  Music music;
  int musicIndex;
  int? playlistId;
  bool isPlayer;

  final _viewModel = PlaylistMainPageViewModel();
  MusicPlayerBottomSheetViewModel viewModel1;

  MusicItemDownloaded({
    super.key,
    required this.music,
    required this.playlistId,
    required this.musicIndex,
    required this.isPlayer,
    required this.viewModel1,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
          margin: EdgeInsets.all(1.px),
          height: 10.h,
          decoration: BoxDecoration(
            color: isPlayer && viewModel1.getActiveMusicId == musicIndex
                ? Colors.orange.shade200
                : Colors.transparent,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () async {
                  if (isPlayer) {
                    viewModel1.changePlayingMusic(music, musicIndex);
                    viewModel1.initialProcess();
                    return;
                  }

                  await _viewModel.setMusicPlaylistPreferences(
                      playlistId: playlistId!, musicIndex: musicIndex);
                  viewModel1.initialProcess();
                  viewModel1.playSong(music, musicIndex);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.h,
                      color: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.music_note,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width -
                          15.h -
                          20.sp -
                          5.px,
                      child: Text(
                        maxLines: 3,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        music.music_name
                            .substring(0, music.music_name.length - 4),
                        style: TextStyle(
                          fontSize: 17.sp,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              isPlayer
                  ? const SizedBox(
                      width: 0,
                      height: 0,
                    )
                  : PopupMenuButton(
                      onSelected: (value) async {
                        if (value == '/addToPlaylist') {
                          await _viewModel.getAllPlaylists();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor:
                                    Theme.of(context).backgroundColor,
                                title: const Text('Oynatma Listeleri'),
                                content: SizedBox(
                                  height: 25.h,
                                  width: 50.w,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _viewModel.playlists.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        onTap: () {
                                          _viewModel.addMusicInPlaylist(
                                              music.id,
                                              _viewModel.playlists[index].id);
                                          Navigator.pop(context);
                                        },
                                        title: Text(
                                          _viewModel.getPlaylists[index]
                                              .playlist_name,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (value == '/delete') {
                          if (playlistId == null) {
                            await _viewModel.deleteMusic(music);
                          } else {
                            await _viewModel.deleteMusicInPlaylist(
                                music.id, playlistId!);
                          }
                        }
                      },
                      itemBuilder: (BuildContext bc) {
                        return const [
                          PopupMenuItem(
                            value: '/addToPlaylist',
                            child: FaIcon(MdiIcons.playlistPlus),
                          ),
                          PopupMenuItem(
                            value: '/delete',
                            child: FaIcon(MdiIcons.delete),
                          ),
                        ];
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
