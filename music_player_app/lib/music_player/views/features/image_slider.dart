import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:music_player_app/music_player/view_models/music_player_bottom_sheet/music_player_bottom_sheet_view_model.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key});

  // final List<String> images = [
  //   "assets/images/cemkaraca.jpg",
  //   "assets/images/barismanco.jpg",
  //   "assets/images/yavuzcetin.jpg",
  // ];

  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<MusicPlayerBottomSheetViewModel>(context, listen: false);
    return Observer(
      builder: (_) {
        if (viewModel.getPlaylistInMusics.isEmpty) {
          return Container();
        }
        return Padding(
          padding: EdgeInsets.only(bottom: 30.px, top: 10.px),
          child: CarouselSlider(
            items: viewModel.getPlaylistInMusics.map((e) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 30.h,
                  width: 30.h,
                  color: Colors.orange,
                  child: const Icon(
                    Icons.music_note,
                    color: Colors.white,
                  ),
                ),
                // Image.asset(
                //   e,
                //   fit: BoxFit.cover,
                //   width: 30.h,
                // ),
              );
            }).toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                viewModel.changePlayingMusic(
                    viewModel.getPlaylistInMusics[index], index);
              },
              initialPage: viewModel.getActiveMusicId,
              enableInfiniteScroll: false,
              enlargeFactor: 0.22,
              enlargeCenterPage: true,
              height: 30.h,
            ),
          ),
        );
      },
    );
  }
}
