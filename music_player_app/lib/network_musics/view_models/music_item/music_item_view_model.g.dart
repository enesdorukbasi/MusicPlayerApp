// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_item_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MusicItemViewModel on MusicItemViewModelBase, Store {
  Computed<bool>? _$getIsDownloadedMusicComputed;

  @override
  bool get getIsDownloadedMusic => (_$getIsDownloadedMusicComputed ??=
          Computed<bool>(() => super.getIsDownloadedMusic,
              name: 'MusicItemViewModelBase.getIsDownloadedMusic'))
      .value;
  Computed<bool>? _$getIsDownloadingComputed;

  @override
  bool get getIsDownloading => (_$getIsDownloadingComputed ??= Computed<bool>(
          () => super.getIsDownloading,
          name: 'MusicItemViewModelBase.getIsDownloading'))
      .value;
  Computed<String>? _$getProgressComputed;

  @override
  String get getProgress =>
      (_$getProgressComputed ??= Computed<String>(() => super.getProgress,
              name: 'MusicItemViewModelBase.getProgress'))
          .value;
  Computed<List<Music>>? _$getAllMusicsComputed;

  @override
  List<Music> get getAllMusics => (_$getAllMusicsComputed ??=
          Computed<List<Music>>(() => super.getAllMusics,
              name: 'MusicItemViewModelBase.getAllMusics'))
      .value;
  Computed<bool>? _$isPlayTrueComputed;

  @override
  bool get isPlayTrue =>
      (_$isPlayTrueComputed ??= Computed<bool>(() => super.isPlayTrue,
              name: 'MusicItemViewModelBase.isPlayTrue'))
          .value;
  Computed<Duration>? _$getDurationComputed;

  @override
  Duration get getDuration =>
      (_$getDurationComputed ??= Computed<Duration>(() => super.getDuration,
              name: 'MusicItemViewModelBase.getDuration'))
          .value;
  Computed<Duration>? _$getPositionComputed;

  @override
  Duration get getPosition =>
      (_$getPositionComputed ??= Computed<Duration>(() => super.getPosition,
              name: 'MusicItemViewModelBase.getPosition'))
          .value;
  Computed<MusicDownloadInfoResult>? _$getInfoResultComputed;

  @override
  MusicDownloadInfoResult get getInfoResult => (_$getInfoResultComputed ??=
          Computed<MusicDownloadInfoResult>(() => super.getInfoResult,
              name: 'MusicItemViewModelBase.getInfoResult'))
      .value;

  late final _$isDownloadedAtom =
      Atom(name: 'MusicItemViewModelBase.isDownloaded', context: context);

  @override
  bool get isDownloaded {
    _$isDownloadedAtom.reportRead();
    return super.isDownloaded;
  }

  @override
  set isDownloaded(bool value) {
    _$isDownloadedAtom.reportWrite(value, super.isDownloaded, () {
      super.isDownloaded = value;
    });
  }

  late final _$isDownloadingAtom =
      Atom(name: 'MusicItemViewModelBase.isDownloading', context: context);

  @override
  bool get isDownloading {
    _$isDownloadingAtom.reportRead();
    return super.isDownloading;
  }

  @override
  set isDownloading(bool value) {
    _$isDownloadingAtom.reportWrite(value, super.isDownloading, () {
      super.isDownloading = value;
    });
  }

  late final _$_progressAtom =
      Atom(name: 'MusicItemViewModelBase._progress', context: context);

  @override
  String get _progress {
    _$_progressAtom.reportRead();
    return super._progress;
  }

  @override
  set _progress(String value) {
    _$_progressAtom.reportWrite(value, super._progress, () {
      super._progress = value;
    });
  }

  late final _$_musicsAtom =
      Atom(name: 'MusicItemViewModelBase._musics', context: context);

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

  late final _$isPlayAtom =
      Atom(name: 'MusicItemViewModelBase.isPlay', context: context);

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

  late final _$durationAtom =
      Atom(name: 'MusicItemViewModelBase.duration', context: context);

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

  late final _$positionAtom =
      Atom(name: 'MusicItemViewModelBase.position', context: context);

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

  late final _$infoResultAtom =
      Atom(name: 'MusicItemViewModelBase.infoResult', context: context);

  @override
  MusicDownloadInfoResult? get infoResult {
    _$infoResultAtom.reportRead();
    return super.infoResult;
  }

  @override
  set infoResult(MusicDownloadInfoResult? value) {
    _$infoResultAtom.reportWrite(value, super.infoResult, () {
      super.infoResult = value;
    });
  }

  late final _$MusicItemViewModelBaseActionController =
      ActionController(name: 'MusicItemViewModelBase', context: context);

  @override
  void onPlayPressed() {
    final _$actionInfo = _$MusicItemViewModelBaseActionController.startAction(
        name: 'MusicItemViewModelBase.onPlayPressed');
    try {
      return super.onPlayPressed();
    } finally {
      _$MusicItemViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDownloaded: ${isDownloaded},
isDownloading: ${isDownloading},
isPlay: ${isPlay},
duration: ${duration},
position: ${position},
infoResult: ${infoResult},
getIsDownloadedMusic: ${getIsDownloadedMusic},
getIsDownloading: ${getIsDownloading},
getProgress: ${getProgress},
getAllMusics: ${getAllMusics},
isPlayTrue: ${isPlayTrue},
getDuration: ${getDuration},
getPosition: ${getPosition},
getInfoResult: ${getInfoResult}
    ''';
  }
}
