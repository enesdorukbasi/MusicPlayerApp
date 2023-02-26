import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:music_player_app/cores/internet_connection_service.dart';
import 'package:music_player_app/network_musics/view_models/network_musics_home_page_view_model/network_musics_home_page_view_model.dart';
import 'package:music_player_app/network_musics/views/features/music_item.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NetworkMusicsHomePage extends StatelessWidget {
  NetworkMusicsHomePage({super.key});

  final _viewModel = NetworkMusicsHomePageViewModel();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _viewModel.searchMusicsFunction("");
    _viewModel.searched = false;
    return Consumer(
      builder: (context, ConnectivityChangeNotifier connectivityChangeNotifier,
          child) {
        if (connectivityChangeNotifier.connectivity !=
            ConnectivityResult.none) {
          return DefaultTabController(
            length: 2,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.1),
                        elevation: 0,
                        toolbarHeight: 120.px,
                        flexibleSpace: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Müzikler',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                shadows: kElevationToShadow[1],
                              ),
                            ),
                            const SizedBox(height: 7),
                            Observer(
                              builder: (_) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 400),
                                  width: _viewModel.getFoldedValue
                                      ? 250.px
                                      : 56.px,
                                  height: 55.px,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Colors.white,
                                    boxShadow: kElevationToShadow[1],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 16.px),
                                          child: _viewModel.getFoldedValue
                                              ? TextField(
                                                  controller:
                                                      textEditingController,
                                                  textInputAction:
                                                      TextInputAction.search,
                                                  onSubmitted: (value) {
                                                    _viewModel
                                                        .searchMusicsFunction(
                                                            value);
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText: 'Müzik Ara',
                                                    hintStyle: TextStyle(
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    border: InputBorder.none,
                                                  ),
                                                )
                                              : null,
                                        ),
                                      ),
                                      AnimatedContainer(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        child: Material(
                                          type: MaterialType.transparency,
                                          child: InkWell(
                                            onTap: () {
                                              if (_viewModel.searched) {
                                                _viewModel
                                                    .searchMusicsFunction("");
                                                _viewModel.closeSearchList();
                                                textEditingController.clear();
                                              } else {
                                                // _viewModel.changeFoldedValue();
                                                _viewModel.searchMusicsFunction(
                                                    textEditingController.text);
                                              }
                                            },
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                  _viewModel.getFoldedValue
                                                      ? 0
                                                      : 32),
                                              bottomLeft: Radius.circular(
                                                  _viewModel.getFoldedValue
                                                      ? 0
                                                      : 32),
                                              topRight:
                                                  const Radius.circular(32),
                                              bottomRight:
                                                  const Radius.circular(32),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(16.px),
                                              child: Center(
                                                child: Icon(
                                                  _viewModel.getFoldedValue
                                                      ? _viewModel.searched
                                                          ? Icons.search_off
                                                          : Icons.search
                                                      : Icons.search,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        automaticallyImplyLeading: false,
                        expandedHeight: 50,
                        floating: true,
                        snap: true,
                      )
                    ];
                  },
                  body: Observer(
                    builder: (context) {
                      if (_viewModel.getLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (_viewModel.getItems.isNotEmpty) {
                        return Stack(
                          children: [
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: _viewModel.getItems.length,
                              itemBuilder: (context, index) {
                                return MusicItem(
                                  musicItem: _viewModel.getItems[index],
                                  homePageViewModel: _viewModel,
                                );
                              },
                            ),
                            Visibility(
                              visible: _viewModel.getLoadingDialog,
                              child: Center(
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    boxShadow: kElevationToShadow[5],
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.orange.shade100),
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "Aranan kriterlere uygun bir müzik bulunamadı.",
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FaIcon(
                  MdiIcons.wifiOff,
                  color: Colors.orange,
                  size: 80.px,
                ),
                const SizedBox(height: 5),
                Text(
                  'İnternet bağlantısı yok!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
