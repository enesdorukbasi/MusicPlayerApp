import 'package:flutter/material.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    return Center(
      child: InkWell(
        onTap: () => viewModel.changePlayingMusic(
            viewModel.getPlaylistInMusics[viewModel.getActiveMusicId + 1],
            viewModel.getActiveMusicId + 1),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.skip_next,
              size: 8.w,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
