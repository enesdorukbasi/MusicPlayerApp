// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LayoutViewModel on LayoutViewModelBase, Store {
  Computed<int>? _$getActiveIndexComputed;

  @override
  int get getActiveIndex =>
      (_$getActiveIndexComputed ??= Computed<int>(() => super.getActiveIndex,
              name: 'LayoutViewModelBase.getActiveIndex'))
          .value;
  Computed<bool>? _$getMusicPlayerIsActiveComputed;

  @override
  bool get getMusicPlayerIsActive => (_$getMusicPlayerIsActiveComputed ??=
          Computed<bool>(() => super.getMusicPlayerIsActive,
              name: 'LayoutViewModelBase.getMusicPlayerIsActive'))
      .value;

  late final _$activeIndexAtom =
      Atom(name: 'LayoutViewModelBase.activeIndex', context: context);

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  late final _$musicPlayerIsActiveAtom =
      Atom(name: 'LayoutViewModelBase.musicPlayerIsActive', context: context);

  @override
  bool get musicPlayerIsActive {
    _$musicPlayerIsActiveAtom.reportRead();
    return super.musicPlayerIsActive;
  }

  @override
  set musicPlayerIsActive(bool value) {
    _$musicPlayerIsActiveAtom.reportWrite(value, super.musicPlayerIsActive, () {
      super.musicPlayerIsActive = value;
    });
  }

  @override
  String toString() {
    return '''
activeIndex: ${activeIndex},
musicPlayerIsActive: ${musicPlayerIsActive},
getActiveIndex: ${getActiveIndex},
getMusicPlayerIsActive: ${getMusicPlayerIsActive}
    ''';
  }
}
