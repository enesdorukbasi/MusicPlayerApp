// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_bottom_sheet_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicPlayerBottomSheetViewModel
    on MusicPlayerBottomSheetViewModelBase, Store {
  Computed<bool>? _$getBottomSheetIsActiveComputed;

  @override
  bool get getBottomSheetIsActive => (_$getBottomSheetIsActiveComputed ??=
          Computed<bool>(() => super.getBottomSheetIsActive,
              name:
                  'MusicPlayerBottomSheetViewModelBase.getBottomSheetIsActive'))
      .value;
  Computed<bool>? _$getBottomSheetIsOpenComputed;

  @override
  bool get getBottomSheetIsOpen => (_$getBottomSheetIsOpenComputed ??=
          Computed<bool>(() => super.getBottomSheetIsOpen,
              name: 'MusicPlayerBottomSheetViewModelBase.getBottomSheetIsOpen'))
      .value;
  Computed<int>? _$getTabbarSelectedIndexComputed;

  @override
  int get getTabbarSelectedIndex => (_$getTabbarSelectedIndexComputed ??=
          Computed<int>(() => super.getTabbarSelectedIndex,
              name:
                  'MusicPlayerBottomSheetViewModelBase.getTabbarSelectedIndex'))
      .value;
  Computed<List<Music>>? _$getPlaylistInMusicsComputed;

  @override
  List<Music> get getPlaylistInMusics => (_$getPlaylistInMusicsComputed ??=
          Computed<List<Music>>(() => super.getPlaylistInMusics,
              name: 'MusicPlayerBottomSheetViewModelBase.getPlaylistInMusics'))
      .value;
  Computed<int>? _$getActiveMusicIdComputed;

  @override
  int get getActiveMusicId => (_$getActiveMusicIdComputed ??= Computed<int>(
          () => super.getActiveMusicId,
          name: 'MusicPlayerBottomSheetViewModelBase.getActiveMusicId'))
      .value;
  Computed<int>? _$getActivePlaylistIdComputed;

  @override
  int get getActivePlaylistId => (_$getActivePlaylistIdComputed ??=
          Computed<int>(() => super.getActivePlaylistId,
              name: 'MusicPlayerBottomSheetViewModelBase.getActivePlaylistId'))
      .value;
  Computed<bool>? _$isPlayTrueComputed;

  @override
  bool get isPlayTrue =>
      (_$isPlayTrueComputed ??= Computed<bool>(() => super.isPlayTrue,
              name: 'MusicPlayerBottomSheetViewModelBase.isPlayTrue'))
          .value;
  Computed<Duration>? _$getDurationComputed;

  @override
  Duration get getDuration =>
      (_$getDurationComputed ??= Computed<Duration>(() => super.getDuration,
              name: 'MusicPlayerBottomSheetViewModelBase.getDuration'))
          .value;
  Computed<Duration>? _$getPositionComputed;

  @override
  Duration get getPosition =>
      (_$getPositionComputed ??= Computed<Duration>(() => super.getPosition,
              name: 'MusicPlayerBottomSheetViewModelBase.getPosition'))
          .value;

  late final _$bottomSheetIsActiveAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase.bottomSheetIsActive',
      context: context);

  @override
  bool get bottomSheetIsActive {
    _$bottomSheetIsActiveAtom.reportRead();
    return super.bottomSheetIsActive;
  }

  @override
  set bottomSheetIsActive(bool value) {
    _$bottomSheetIsActiveAtom.reportWrite(value, super.bottomSheetIsActive, () {
      super.bottomSheetIsActive = value;
    });
  }

  late final _$bottomSheetIsOpenAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase.bottomSheetIsOpen',
      context: context);

  @override
  bool get bottomSheetIsOpen {
    _$bottomSheetIsOpenAtom.reportRead();
    return super.bottomSheetIsOpen;
  }

  @override
  set bottomSheetIsOpen(bool value) {
    _$bottomSheetIsOpenAtom.reportWrite(value, super.bottomSheetIsOpen, () {
      super.bottomSheetIsOpen = value;
    });
  }

  late final _$_tabbarSelectedIndexAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase._tabbarSelectedIndex',
      context: context);

  @override
  int get _tabbarSelectedIndex {
    _$_tabbarSelectedIndexAtom.reportRead();
    return super._tabbarSelectedIndex;
  }

  @override
  set _tabbarSelectedIndex(int value) {
    _$_tabbarSelectedIndexAtom.reportWrite(value, super._tabbarSelectedIndex,
        () {
      super._tabbarSelectedIndex = value;
    });
  }

  late final _$_musicsAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase._musics', context: context);

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

  late final _$_activeMusicIdAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase._activeMusicId',
      context: context);

  @override
  int get _activeMusicId {
    _$_activeMusicIdAtom.reportRead();
    return super._activeMusicId;
  }

  @override
  set _activeMusicId(int value) {
    _$_activeMusicIdAtom.reportWrite(value, super._activeMusicId, () {
      super._activeMusicId = value;
    });
  }

  late final _$_activePlaylistIdAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase._activePlaylistId',
      context: context);

  @override
  int get _activePlaylistId {
    _$_activePlaylistIdAtom.reportRead();
    return super._activePlaylistId;
  }

  @override
  set _activePlaylistId(int value) {
    _$_activePlaylistIdAtom.reportWrite(value, super._activePlaylistId, () {
      super._activePlaylistId = value;
    });
  }

  late final _$isPlayAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase.isPlay', context: context);

  @override
  bool get isPlay {
    _$isPlayAtom.reportRead();
    return super.isPlay;
  }

  @override
  set isPlay(bool value) {
    _$isPlayAtom.reportWrite(value, super.isPlay, () {
      super.isPlay = value;
    });
  }

  late final _$durationAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase.duration', context: context);

  @override
  Duration get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(Duration value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$positionAtom = Atom(
      name: 'MusicPlayerBottomSheetViewModelBase.position', context: context);

  @override
  Duration get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$MusicPlayerBottomSheetViewModelBaseActionController =
      ActionController(
          name: 'MusicPlayerBottomSheetViewModelBase', context: context);

  @override
  void onPlayPressed() {
    final _$actionInfo = _$MusicPlayerBottomSheetViewModelBaseActionController
        .startAction(name: 'MusicPlayerBottomSheetViewModelBase.onPlayPressed');
    try {
      return super.onPlayPressed();
    } finally {
      _$MusicPlayerBottomSheetViewModelBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bottomSheetIsActive: ${bottomSheetIsActive},
bottomSheetIsOpen: ${bottomSheetIsOpen},
isPlay: ${isPlay},
duration: ${duration},
position: ${position},
getBottomSheetIsActive: ${getBottomSheetIsActive},
getBottomSheetIsOpen: ${getBottomSheetIsOpen},
getTabbarSelectedIndex: ${getTabbarSelectedIndex},
getPlaylistInMusics: ${getPlaylistInMusics},
getActiveMusicId: ${getActiveMusicId},
getActivePlaylistId: ${getActivePlaylistId},
isPlayTrue: ${isPlayTrue},
getDuration: ${getDuration},
getPosition: ${getPosition}
    ''';
  }
}
