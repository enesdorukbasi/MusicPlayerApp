// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_item_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaylistItemViewModel on PlaylistItemViewModelBase, Store {
  Computed<int>? _$getMusicCountComputed;

  @override
  int get getMusicCount =>
      (_$getMusicCountComputed ??= Computed<int>(() => super.getMusicCount,
              name: 'PlaylistItemViewModelBase.getMusicCount'))
          .value;

  late final _$_musicCountAtom =
      Atom(name: 'PlaylistItemViewModelBase._musicCount', context: context);

  @override
  int get _musicCount {
    _$_musicCountAtom.reportRead();
    return super._musicCount;
  }

  @override
  set _musicCount(int value) {
    _$_musicCountAtom.reportWrite(value, super._musicCount, () {
      super._musicCount = value;
    });
  }

  @override
  String toString() {
    return '''
getMusicCount: ${getMusicCount}
    ''';
  }
}
