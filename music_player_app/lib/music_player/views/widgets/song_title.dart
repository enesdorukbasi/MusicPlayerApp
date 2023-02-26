import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SongTitle extends StatelessWidget {
  const SongTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    return Observer(
      builder: (context) {
        if (viewModel.getPlaylistInMusics.isEmpty ||
            // ignore: unnecessary_null_comparison
            viewModel.getActiveMusicId == null) {
          return Container();
        }
        return Text(
          viewModel.getPlaylistInMusics[viewModel.getActiveMusicId].music_name
              .substring(
            0,
            viewModel.getPlaylistInMusics[viewModel.getActiveMusicId].music_name
                    .length -
                4,
          ),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
