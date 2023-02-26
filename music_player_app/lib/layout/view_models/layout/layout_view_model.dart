import 'package:mobx/mobx.dart';

part 'layout_view_model.g.dart';

class LayoutViewModel = LayoutViewModelBase with _$LayoutViewModel;

abstract class LayoutViewModelBase with Store {
  @computed
  int get getActiveIndex => activeIndex;
  @computed
  bool get getMusicPlayerIsActive => musicPlayerIsActive;

  @observable
  int activeIndex = 0;
  @observable
  bool musicPlayerIsActive = false;

  void changeActiveIndex(int index) {
    activeIndex = index;
  }
}
