import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    return InkWell(
      onTap: () => viewModel.onPlayPressed(),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Observer(
            builder: (_) {
              return Icon(
                viewModel.isPlayTrue ? Icons.pause : Icons.play_arrow,
                size: 10.w,
                color: Colors.white,
              );
            },
          ),
        ),
      ),
    );
  }
}
