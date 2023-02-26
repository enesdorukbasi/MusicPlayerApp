import 'package:mobx/mobx.dart';
import 'package:music_player_app/cores/youtube_service.dart';
import 'package:music_player_app/models/search_musics.dart';

part 'network_musics_home_page_view_model.g.dart';

class NetworkMusicsHomePageViewModel = NetworkMusicsHomePageViewModelBase
    with _$NetworkMusicsHomePageViewModel;

abstract class NetworkMusicsHomePageViewModelBase with Store {
  @computed
  bool get getFoldedValue => folded;
  @computed
  bool get getLoading => loading;
  @computed
  bool get getLoadingDialog => loadingDialog;
  @computed
  bool get getSearchedValue => searched;
  @computed
  SearchMusics? get getSearchMusics => searchMusics;
  @computed
  List<Item> get getItems => items;

  @observable
  bool folded = true;
  @observable
  bool loading = false;
  @observable
  bool loadingDialog = false;
  @observable
  bool searched = false;
  @observable
  SearchMusics? searchMusics;
  @observable
  List<Item> items = [];

  void changeFoldedValue() {
    // folded = !folded;
  }

  Future<void> searchMusicsFunction(String searchingText) async {
    searched = true;
    loading = true;
    searchMusics = await YoutubeServices.getSearchMusics(searchingText);
    items = searchMusics!.items;
    loading = false;
  }

  void closeSearchList() {
    searched = false;
    loading = false;
  }
}
