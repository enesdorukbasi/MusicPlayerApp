import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:music_player_app/cores/shared_preferences/admob_counter_preferences.dart';
import 'package:music_player_app/network_musics/view_models/music_item/music_item_view_model.dart';
import 'package:music_player_app/network_musics/view_models/network_musics_home_page_view_model/network_musics_home_page_view_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../models/search_musics.dart';

// ignore: must_be_immutable
class MusicItem extends StatelessWidget {
  final Item musicItem;
  NetworkMusicsHomePageViewModel homePageViewModel;
  MusicItem(
      {super.key, required this.musicItem, required this.homePageViewModel});

  late final RewardedAd rewardedAd;
  final String rewardedAdUnitId = "YOUR_REWARDED_AD_ID";

  void loadedRewardedAd() {
    RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdFailedToLoad: (LoadAdError error) {},
        onAdLoaded: (RewardedAd ad) {
          rewardedAd = ad;

          setFullScreenContentCallback();
        },
      ),
    );
  }

  setFullScreenContentCallback() {
    // ignore: unnecessary_null_comparison
    if (rewardedAd == null) return;
    rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) =>
          // ignore: avoid_print
          print("$ad onAdShowedFullScreenContent"),
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
      },
      // ignore: avoid_print
      onAdImpression: (ad) => print("$ad onAdImpression"),
    );
  }

  showRewardedAd() {
    rewardedAd.show(
      onUserEarnedReward: (ad, reward) {
        // ignore: unused_local_variable
        num amount = reward.amount;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MusicItemViewModel viewModel = MusicItemViewModel();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.px),
      child: Container(
        width: double.infinity,
        height: 10.h,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 10.h,
              width: 10.h,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img.youtube.com/vi/${musicItem.id.videoId}/hqdefault.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                musicItem.snippet.title,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                int count = await AdmobPreferencesCounter().getPreferences();
                if (count >= 4) {
                  loadedRewardedAd();
                }
                try {
                  homePageViewModel.loadingDialog = true;
                  await viewModel.getMusicInfoApiConnect(
                    musicItem.id.videoId,
                    "${musicItem.snippet.title}.mp3",
                  );

                  await viewModel.fileControl(musicItem.id.videoId);
                  viewModel.playSong(musicItem.id.videoId);

                  viewModel.audioPlayer.durationStream.listen((event) {
                    if (event != null) viewModel.duration = event;
                  });

                  viewModel.audioPlayer.positionStream.listen((event) {
                    viewModel.position = event;
                  });
                  homePageViewModel.loadingDialog = false;
                } catch (e) {
                  homePageViewModel.loadingDialog = false;
                }
                showDialog(
                  routeSettings: const RouteSettings(),
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) => Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: const EdgeInsets.all(5),
                    child: Container(
                      height: 35.h,
                      color: Colors.transparent,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Theme.of(context).backgroundColor,
                            ),
                            padding: EdgeInsets.fromLTRB(5.w, 6.h, 5.w, 5.w),
                            child: Column(
                              children: [
                                Text(
                                  musicItem.snippet.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Observer(
                                      builder: (_) {
                                        return IconButton(
                                          onPressed: () {
                                            viewModel.onPlayPressed();
                                          },
                                          icon: FaIcon(
                                            viewModel.isPlayTrue
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 30.px,
                                          ),
                                        );
                                      },
                                    ),
                                    Observer(
                                      builder: (_) {
                                        return SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              30.w,
                                          child: ProgressBar(
                                            progress: Duration(
                                                seconds: viewModel
                                                    .getPosition.inSeconds),
                                            total: Duration(
                                                seconds: viewModel
                                                    .getDuration.inSeconds),
                                            onDragUpdate: (details) async {
                                              final position = Duration(
                                                  seconds: details
                                                      .timeStamp.inSeconds);
                                              await viewModel.audioPlayer
                                                  .seek(position);
                                            },
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                                Observer(
                                  builder: (context) {
                                    return InkWell(
                                      onTap: () {
                                        if (viewModel.getIsDownloading) {
                                          return;
                                        }
                                        if (!viewModel.getIsDownloadedMusic) {
                                          if (count >= 4) {
                                            showRewardedAd();
                                            AdmobPreferencesCounter()
                                                .setZeroPreference();
                                          } else {
                                            AdmobPreferencesCounter()
                                                .setPreferences();
                                          }
                                          viewModel.downloadMusic(
                                            viewModel.infoResult!.audio.audio,
                                            "${musicItem.snippet.title}.mp3",
                                            musicItem.id.videoId,
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 6.h,
                                        height: 6.h,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.circle,
                                          boxShadow: kElevationToShadow[3],
                                        ),
                                        child: Center(
                                          child: FaIcon(
                                            viewModel.getIsDownloading
                                                ? MdiIcons.timerSand
                                                : (viewModel
                                                        .getIsDownloadedMusic
                                                    ? Icons.download_done
                                                    : Icons.download),
                                            color: Colors.white,
                                            size: 30.px,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              height: 20.w,
                              width: 20.w,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: FaIcon(
                                  MdiIcons.musicNote,
                                  color: Colors.white,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5.h,
                            right: 5,
                            child: IconButton(
                              onPressed: () {
                                viewModel.stopSong();
                                Navigator.pop(ctx);
                              },
                              icon: FaIcon(
                                Icons.close,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 10.px),
                width: 50.px,
                height: 50.px,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                ),
                child: Icon(
                  MdiIcons.eye,
                  color: Colors.white,
                  size: 30.px,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
