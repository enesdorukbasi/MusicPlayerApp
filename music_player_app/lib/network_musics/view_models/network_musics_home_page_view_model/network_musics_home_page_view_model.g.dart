// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_musics_home_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NetworkMusicsHomePageViewModel
    on NetworkMusicsHomePageViewModelBase, Store {
  Computed<bool>? _$getFoldedValueComputed;

  @override
  bool get getFoldedValue =>
      (_$getFoldedValueComputed ??= Computed<bool>(() => super.getFoldedValue,
              name: 'NetworkMusicsHomePageViewModelBase.getFoldedValue'))
          .value;
  Computed<bool>? _$getLoadingComputed;

  @override
  bool get getLoading =>
      (_$getLoadingComputed ??= Computed<bool>(() => super.getLoading,
              name: 'NetworkMusicsHomePageViewModelBase.getLoading'))
          .value;
  Computed<bool>? _$getLoadingDialogComputed;

  @override
  bool get getLoadingDialog => (_$getLoadingDialogComputed ??= Computed<bool>(
          () => super.getLoadingDialog,
          name: 'NetworkMusicsHomePageViewModelBase.getLoadingDialog'))
      .value;
  Computed<bool>? _$getSearchedValueComputed;

  @override
  bool get getSearchedValue => (_$getSearchedValueComputed ??= Computed<bool>(
          () => super.getSearchedValue,
          name: 'NetworkMusicsHomePageViewModelBase.getSearchedValue'))
      .value;
  Computed<SearchMusics?>? _$getSearchMusicsComputed;

  @override
  SearchMusics? get getSearchMusics => (_$getSearchMusicsComputed ??=
          Computed<SearchMusics?>(() => super.getSearchMusics,
              name: 'NetworkMusicsHomePageViewModelBase.getSearchMusics'))
      .value;
  Computed<List<Item>>? _$getItemsComputed;

  @override
  List<Item> get getItems =>
      (_$getItemsComputed ??= Computed<List<Item>>(() => super.getItems,
              name: 'NetworkMusicsHomePageViewModelBase.getItems'))
          .value;

  late final _$foldedAtom =
      Atom(name: 'NetworkMusicsHomePageViewModelBase.folded', context: context);

  @override
  bool get folded {
    _$foldedAtom.reportRead();
    return super.folded;
  }

  @override
  set folded(bool value) {
    _$foldedAtom.reportWrite(value, super.folded, () {
      super.folded = value;
    });
  }

  late final _$loadingAtom = Atom(
      name: 'NetworkMusicsHomePageViewModelBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$loadingDialogAtom = Atom(
      name: 'NetworkMusicsHomePageViewModelBase.loadingDialog',
      context: context);

  @override
  bool get loadingDialog {
    _$loadingDialogAtom.reportRead();
    return super.loadingDialog;
  }

  @override
  set loadingDialog(bool value) {
    _$loadingDialogAtom.reportWrite(value, super.loadingDialog, () {
      super.loadingDialog = value;
    });
  }

  late final _$searchedAtom = Atom(
      name: 'NetworkMusicsHomePageViewModelBase.searched', context: context);

  @override
  bool get searched {
    _$searchedAtom.reportRead();
    return super.searched;
  }

  @override
  set searched(bool value) {
    _$searchedAtom.reportWrite(value, super.searched, () {
      super.searched = value;
    });
  }

  late final _$searchMusicsAtom = Atom(
      name: 'NetworkMusicsHomePageViewModelBase.searchMusics',
      context: context);

  @override
  SearchMusics? get searchMusics {
    _$searchMusicsAtom.reportRead();
    return super.searchMusics;
  }

  @override
  set searchMusics(SearchMusics? value) {
    _$searchMusicsAtom.reportWrite(value, super.searchMusics, () {
      super.searchMusics = value;
    });
  }

  late final _$itemsAtom =
      Atom(name: 'NetworkMusicsHomePageViewModelBase.items', context: context);

  @override
  List<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  @override
  String toString() {
    return '''
folded: ${folded},
loading: ${loading},
loadingDialog: ${loadingDialog},
searched: ${searched},
searchMusics: ${searchMusics},
items: ${items},
getFoldedValue: ${getFoldedValue},
getLoading: ${getLoading},
getLoadingDialog: ${getLoadingDialog},
getSearchedValue: ${getSearchedValue},
getSearchMusics: ${getSearchMusics},
getItems: ${getItems}
    ''';
  }
}
