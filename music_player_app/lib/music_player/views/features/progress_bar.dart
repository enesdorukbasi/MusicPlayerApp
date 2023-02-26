import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: true);
    return Observer(
      builder: (context) {
        return Column(
          children: [
            // Slider(
            //   min: 0,
            //   max: _viewModel.getDuration.inSeconds.toDouble(),
            //   value: _viewModel.getPosition.inSeconds.toDouble(),
            //   onChanged: (value) async {
            //     final position = Duration(seconds: value.toInt());
            //     await _viewModel.audioPlayer.seek(position);
            //   },
            // ),
            ProgressBar(
              progress: Duration(seconds: viewModel.getPosition.inSeconds),
              total: Duration(seconds: viewModel.getDuration.inSeconds),
              onDragUpdate: (details) async {
                final position = Duration(seconds: details.timeStamp.inSeconds);
                await viewModel.audioPlayer.seek(position);
              },
            ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         _viewModel.getPosition.abs().toString(),
            //         style: TextStyle(
            //           color: Colors.orange,
            //           fontSize: 15.sp,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text(
            //         _viewModel.getDuration.inMinutes.toDouble().toString(),
            //         style: TextStyle(
            //           color: Colors.orange,
            //           fontSize: 15.sp,
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //     ],
            //   ),
            // )
          ],
        );
      },
    );
  }
}
