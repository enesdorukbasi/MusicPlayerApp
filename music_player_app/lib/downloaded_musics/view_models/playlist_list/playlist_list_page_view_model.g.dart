// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_list_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaylistListPageViewModel on PlaylistListPageViewModelBase, Store {
  Computed<int>? _$getCountComputed;

  @override
  int get getCount =>
      (_$getCountComputed ??= Computed<int>(() => super.getCount,
              name: 'PlaylistListPageViewModelBase.getCount'))
          .value;
  Computed<List<Playlist>>? _$getPlaylistsComputed;

  @override
  List<Playlist> get getPlaylists => (_$getPlaylistsComputed ??=
          Computed<List<Playlist>>(() => super.getPlaylists,
              name: 'PlaylistListPageViewModelBase.getPlaylists'))
      .value;

  late final _$_countAtom =
      Atom(name: 'PlaylistListPageViewModelBase._count', context: context);

  @override
  int get _count {
    _$_countAtom.reportRead();
    return super._count;
  }

  @override
  set _count(int value) {
    _$_countAtom.reportWrite(value, super._count, () {
      super._count = value;
    });
  }

  late final _$playlistsAtom =
      Atom(name: 'PlaylistListPageViewModelBase.playlists', context: context);

  @override
  List<Playlist> get playlists {
    _$playlistsAtom.reportRead();
    return super.playlists;
  }

  @override
  set playlists(List<Playlist> value) {
    _$playlistsAtom.reportWrite(value, super.playlists, () {
      super.playlists = value;
    });
  }

  @override
  String toString() {
    return '''
playlists: ${playlists},
getCount: ${getCount},
getPlaylists: ${getPlaylists}
    ''';
  }
}
