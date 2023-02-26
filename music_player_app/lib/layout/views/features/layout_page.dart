import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:music_player_app/downloaded_musics/views/playlist_list_page.dart';
import 'package:music_player_app/layout/view_models/layout/layout_view_model.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:music_player_app/music_player/views/music_player_bottom_sheet.dart';
import 'package:music_player_app/network_musics/views/features/network_musics_home_page.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

// ignore: must_be_immutable
class LayoutPage extends StatelessWidget {
  LayoutPage({super.key});

  final _viewModel = LayoutViewModel();
  final musicPlayerBottomSheetViewModel = MusicPlayerBottomSheetViewModel();

  final List<Widget> _pageLists = [
    NetworkMusicsHomePage(),
    PlaylistListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    StreamingSharedPreferences preferences =
        Provider.of<StreamingSharedPreferences>(context, listen: true);
    return Provider<MusicPlayerBottomSheetViewModel>(
      create: (_) => musicPlayerBottomSheetViewModel,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        bottomSheet: PreferenceBuilder<bool>(
          preference:
              preferences.getBool('bottomSheetIsActive', defaultValue: false),
          builder: (context, value) {
            if (value) {
              return MusicPlayerBottomSheet();
            }
            return const SizedBox(
              width: 0,
              height: 0,
            );
          },
        ),
        body: Observer(
          builder: (_) => _pageLists[_viewModel.getActiveIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) => _viewModel.changeActiveIndex(value),
          currentIndex: _viewModel.getActiveIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Theme.of(context).primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Observer(
                builder: (_) {
                  if (_viewModel.getActiveIndex == 0) {
                    return Icon(
                      MdiIcons.web,
                      color: Colors.white,
                      size: 4.5.h,
                    );
                  } else {
                    return Icon(
                      MdiIcons.web,
                      color: Colors.white,
                      size: 3.5.h,
                    );
                  }
                },
              ),
              label: "Ara",
            ),
            BottomNavigationBarItem(
              icon: Observer(
                builder: (_) {
                  if (_viewModel.getActiveIndex == 1) {
                    return Icon(
                      MdiIcons.musicBoxMultipleOutline,
                      color: Colors.white,
                      size: 4.5.h,
                    );
                  } else {
                    return Icon(
                      MdiIcons.musicBoxMultipleOutline,
                      color: Colors.white,
                      size: 3.5.h,
                    );
                  }
                },
              ),
              label: "İndirilenler",
            ),
          ],
        ),
      ),
    );
  }
}
