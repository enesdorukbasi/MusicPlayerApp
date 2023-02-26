// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:music_player_app/downloaded_musics/view_models/playlist_list/playlist_list_page_view_model.dart';
import 'package:music_player_app/downloaded_musics/widgets/playlist_item.dart';
import 'package:music_player_app/downloaded_musics/views/playlist_main_page.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlaylistListPage extends StatelessWidget {
  final _viewModel = PlaylistListPageViewModel();

  PlaylistListPage({super.key});

  @override
  Widget build(BuildContext context) {
    _viewModel.getCountAllMusics();
    _viewModel.getAllPlaylists();
    final musicPlayerBottomSheetViewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.orange.shade100,
          elevation: 0,
          toolbarHeight: 65.px,
          title: Text(
            'Müzik Listeleri',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {
                    TextEditingController textEditingController =
                        TextEditingController();
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        content: TextFormField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            hintText: "Playlist Adı",
                          ),
                        ),
                        actions: <Widget>[
                          InkWell(
                            onTap: () async {
                              await _viewModel
                                  .createPlaylist(textEditingController.text);
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.px,
                                horizontal: 15.px,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Text(
                                "Kaydet",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.sp),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  icon: FaIcon(
                    MdiIcons.playlistPlus,
                    size: 35.px,
                    color: Theme.of(context).primaryColor,
                  )),
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            return ListView.builder(
              itemCount: _viewModel.getPlaylists.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PlaylistMainPage(
                                playlistId: null,
                                playlistTitle: "Tüm İndirilenler",
                                musicPlayerBottomSheetViewModel:
                                    musicPlayerBottomSheetViewModel,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 1.px),
                          width: double.infinity,
                          height: 12.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.15),
                          ),
                          child: Center(
                            child: Text(
                              "Tüm İndirilenler - ${_viewModel.getCount} şarkı",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      PlaylistItem(
                        playlist: _viewModel.getPlaylists[index],
                        index: index,
                      ),
                    ],
                  );
                }
                return PlaylistItem(
                  playlist: _viewModel.getPlaylists[index],
                  index: index,
                );
              },
            );
          },
        ));
  }
}
