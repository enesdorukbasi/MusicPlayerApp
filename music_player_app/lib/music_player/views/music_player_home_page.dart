import 'package:flutter/material.dart';
import 'package:music_player_app/music_player/views/features/image_slider.dart';
import 'package:music_player_app/music_player/views/features/progess_bottom.dart';
import 'package:music_player_app/music_player/views/features/progress_bar.dart';
import 'package:music_player_app/music_player/views/features/progress_top.dart';
import 'package:music_player_app/music_player/views/widgets/title_text.dart';

class MusicPlayerHomePage extends StatelessWidget {
  const MusicPlayerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: const [
                TitleText(),
                ImageSlider(),
                ProgressTop(),
                CustomProgressBar(),
                Align(
                  alignment: Alignment.center,
                  child: ProgressBottom(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
