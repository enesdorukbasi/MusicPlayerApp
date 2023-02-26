import 'package:flutter/material.dart';
import 'package:music_player_app/music_player/views/widgets/song_title.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProgressTop extends StatelessWidget {
  const ProgressTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SongTitle(),
        ],
      ),
    );
  }
}
