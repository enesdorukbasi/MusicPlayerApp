// ignore_for_file: depend_on_referenced_packages

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:music_player_app/cores/internet_connection_service.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:music_player_app/layout/views/features/layout_page.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = await StreamingSharedPreferences.instance;
  MobileAds.instance.initialize();

  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );

  runApp(MyApp(preferences: preferences));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.preferences});

  StreamingSharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        ConnectivityChangeNotifier changeNotifier =
            ConnectivityChangeNotifier();
        changeNotifier.initialLoad();
        return changeNotifier;
      },
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Provider<StreamingSharedPreferences>(
            create: (_) => preferences,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Müzik Çalar',
              theme: ThemeData(
                backgroundColor: Colors.orange.shade50,
                primarySwatch: Colors.orange,
              ),
              home: const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      centered: true,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            'assets/images/app_icon.png',
            fit: BoxFit.cover,
          ),
          Text(
            'Müzik Çalar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          )
        ],
      ),
      backgroundColor: Colors.orange,
      splashIconSize: MediaQuery.of(context).size.height,
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
      nextScreen: LayoutPage(),
    );
  }
}
