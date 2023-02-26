// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:music_player_app/downloaded_musics/view_models/playlist_item/playlist_item_view_model.dart';
import 'package:music_player_app/downloaded_musics/views/playlist_main_page.dart';
import 'package:music_player_app/models/playlist.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlaylistItem extends StatelessWidget {
  Playlist playlist;
  int index;

  final _viewModel = PlaylistItemViewModel();

  PlaylistItem({super.key, required this.playlist, required this.index});

  @override
  Widget build(BuildContext context) {
    _viewModel.getCountAllMusics(playlist.id);
    final musicPlayerBottomSheetViewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PlaylistMainPage(
              playlistId: playlist.id,
              playlistTitle: playlist.playlist_name,
              musicPlayerBottomSheetViewModel: musicPlayerBottomSheetViewModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 1.px),
        width: double.infinity,
        height: 12.h,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.px),
              child: Observer(
                builder: (_) {
                  return Text(
                    "${playlist.playlist_name} - ${_viewModel.getMusicCount}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  );
                },
              ),
            ),
            PopupMenuButton(
              onSelected: (value) async {
                if (value == '/delete') {
                  await _viewModel.deletePlaylist(playlist.id);
                }
              },
              itemBuilder: (context) {
                return const [
                  PopupMenuItem(
                    value: '/edit',
                    child: FaIcon(MdiIcons.playlistEdit),
                  ),
                  PopupMenuItem(
                    value: '/delete',
                    child: FaIcon(MdiIcons.delete),
                  ),
                ];
              },
            )
          ],
        ),
      ),
    );
  }
}
