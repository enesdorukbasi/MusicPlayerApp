// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_main_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlaylistMainPageViewModel on PlaylistMainPageViewModelBase, Store {
  Computed<List<Music>>? _$getMusicsComputed;

  @override
  List<Music> get getMusics =>
      (_$getMusicsComputed ??= Computed<List<Music>>(() => super.getMusics,
              name: 'PlaylistMainPageViewModelBase.getMusics'))
          .value;
  Computed<List<Playlist>>? _$getPlaylistsComputed;

  @override
  List<Playlist> get getPlaylists => (_$getPlaylistsComputed ??=
          Computed<List<Playlist>>(() => super.getPlaylists,
              name: 'PlaylistMainPageViewModelBase.getPlaylists'))
      .value;

  late final _$_musicsAtom =
      Atom(name: 'PlaylistMainPageViewModelBase._musics', context: context);

  @override
  List<Music> get _musics {
    _$_musicsAtom.reportRead();
    return super._musics;
  }

  @override
  set _musics(List<Music> value) {
    _$_musicsAtom.reportWrite(value, super._musics, () {
      super._musics = value;
    });
  }

  late final _$playlistsAtom =
      Atom(name: 'PlaylistMainPageViewModelBase.playlists', context: context);

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
getMusics: ${getMusics},
getPlaylists: ${getPlaylists}
    ''';
  }
}
