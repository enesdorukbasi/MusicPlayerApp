import 'package:flutter/material.dart';
import 'package:music_player_app/music_player/views/music_page_buttons/next_button.dart';
import 'package:music_player_app/music_player/views/music_page_buttons/play_button.dart';
import 'package:music_player_app/music_player/views/music_page_buttons/previous_button.dart';

class ProgressBottom extends StatelessWidget {
  const ProgressBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          PreviousButton(),
          SizedBox(width: 10),
          PlayButton(),
          SizedBox(width: 10),
          NextButton(),
        ],
      ),
    );
  }
}
