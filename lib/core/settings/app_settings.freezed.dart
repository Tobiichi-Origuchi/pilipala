// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSettings {
  int get imgQuality => throw _privateConstructorUsedError;
  FullScreenGestureMode get fullScreenGestureMode =>
      throw _privateConstructorUsedError;
  bool get enablePlayerControlAnimation => throw _privateConstructorUsedError;
  List<String> get actionTypeSort => throw _privateConstructorUsedError; // 弹幕相关
  bool get isOpenDanmu => throw _privateConstructorUsedError;
  List<dynamic> get blockTypes => throw _privateConstructorUsedError;
  double get showArea => throw _privateConstructorUsedError;
  double get opacityVal => throw _privateConstructorUsedError;
  double get fontSizeVal => throw _privateConstructorUsedError;
  double get danmakuDurationVal => throw _privateConstructorUsedError;
  double get strokeWidth => throw _privateConstructorUsedError; // 播放器相关
  PlayRepeat get playRepeat => throw _privateConstructorUsedError;
  double get playbackSpeed => throw _privateConstructorUsedError;
  bool get enableAutoLongPressSpeed => throw _privateConstructorUsedError;
  double get longPressSpeed => throw _privateConstructorUsedError;
  List<double> get speedsList => throw _privateConstructorUsedError; // 用户信息
  UserInfoData? get userInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {int imgQuality,
      FullScreenGestureMode fullScreenGestureMode,
      bool enablePlayerControlAnimation,
      List<String> actionTypeSort,
      bool isOpenDanmu,
      List<dynamic> blockTypes,
      double showArea,
      double opacityVal,
      double fontSizeVal,
      double danmakuDurationVal,
      double strokeWidth,
      PlayRepeat playRepeat,
      double playbackSpeed,
      bool enableAutoLongPressSpeed,
      double longPressSpeed,
      List<double> speedsList,
      UserInfoData? userInfo});
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgQuality = null,
    Object? fullScreenGestureMode = null,
    Object? enablePlayerControlAnimation = null,
    Object? actionTypeSort = null,
    Object? isOpenDanmu = null,
    Object? blockTypes = null,
    Object? showArea = null,
    Object? opacityVal = null,
    Object? fontSizeVal = null,
    Object? danmakuDurationVal = null,
    Object? strokeWidth = null,
    Object? playRepeat = null,
    Object? playbackSpeed = null,
    Object? enableAutoLongPressSpeed = null,
    Object? longPressSpeed = null,
    Object? speedsList = null,
    Object? userInfo = freezed,
  }) {
    return _then(_value.copyWith(
      imgQuality: null == imgQuality
          ? _value.imgQuality
          : imgQuality // ignore: cast_nullable_to_non_nullable
              as int,
      fullScreenGestureMode: null == fullScreenGestureMode
          ? _value.fullScreenGestureMode
          : fullScreenGestureMode // ignore: cast_nullable_to_non_nullable
              as FullScreenGestureMode,
      enablePlayerControlAnimation: null == enablePlayerControlAnimation
          ? _value.enablePlayerControlAnimation
          : enablePlayerControlAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      actionTypeSort: null == actionTypeSort
          ? _value.actionTypeSort
          : actionTypeSort // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOpenDanmu: null == isOpenDanmu
          ? _value.isOpenDanmu
          : isOpenDanmu // ignore: cast_nullable_to_non_nullable
              as bool,
      blockTypes: null == blockTypes
          ? _value.blockTypes
          : blockTypes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      showArea: null == showArea
          ? _value.showArea
          : showArea // ignore: cast_nullable_to_non_nullable
              as double,
      opacityVal: null == opacityVal
          ? _value.opacityVal
          : opacityVal // ignore: cast_nullable_to_non_nullable
              as double,
      fontSizeVal: null == fontSizeVal
          ? _value.fontSizeVal
          : fontSizeVal // ignore: cast_nullable_to_non_nullable
              as double,
      danmakuDurationVal: null == danmakuDurationVal
          ? _value.danmakuDurationVal
          : danmakuDurationVal // ignore: cast_nullable_to_non_nullable
              as double,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      playRepeat: null == playRepeat
          ? _value.playRepeat
          : playRepeat // ignore: cast_nullable_to_non_nullable
              as PlayRepeat,
      playbackSpeed: null == playbackSpeed
          ? _value.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      enableAutoLongPressSpeed: null == enableAutoLongPressSpeed
          ? _value.enableAutoLongPressSpeed
          : enableAutoLongPressSpeed // ignore: cast_nullable_to_non_nullable
              as bool,
      longPressSpeed: null == longPressSpeed
          ? _value.longPressSpeed
          : longPressSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      speedsList: null == speedsList
          ? _value.speedsList
          : speedsList // ignore: cast_nullable_to_non_nullable
              as List<double>,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingsImplCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$AppSettingsImplCopyWith(
          _$AppSettingsImpl value, $Res Function(_$AppSettingsImpl) then) =
      __$$AppSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int imgQuality,
      FullScreenGestureMode fullScreenGestureMode,
      bool enablePlayerControlAnimation,
      List<String> actionTypeSort,
      bool isOpenDanmu,
      List<dynamic> blockTypes,
      double showArea,
      double opacityVal,
      double fontSizeVal,
      double danmakuDurationVal,
      double strokeWidth,
      PlayRepeat playRepeat,
      double playbackSpeed,
      bool enableAutoLongPressSpeed,
      double longPressSpeed,
      List<double> speedsList,
      UserInfoData? userInfo});
}

/// @nodoc
class __$$AppSettingsImplCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$AppSettingsImpl>
    implements _$$AppSettingsImplCopyWith<$Res> {
  __$$AppSettingsImplCopyWithImpl(
      _$AppSettingsImpl _value, $Res Function(_$AppSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgQuality = null,
    Object? fullScreenGestureMode = null,
    Object? enablePlayerControlAnimation = null,
    Object? actionTypeSort = null,
    Object? isOpenDanmu = null,
    Object? blockTypes = null,
    Object? showArea = null,
    Object? opacityVal = null,
    Object? fontSizeVal = null,
    Object? danmakuDurationVal = null,
    Object? strokeWidth = null,
    Object? playRepeat = null,
    Object? playbackSpeed = null,
    Object? enableAutoLongPressSpeed = null,
    Object? longPressSpeed = null,
    Object? speedsList = null,
    Object? userInfo = freezed,
  }) {
    return _then(_$AppSettingsImpl(
      imgQuality: null == imgQuality
          ? _value.imgQuality
          : imgQuality // ignore: cast_nullable_to_non_nullable
              as int,
      fullScreenGestureMode: null == fullScreenGestureMode
          ? _value.fullScreenGestureMode
          : fullScreenGestureMode // ignore: cast_nullable_to_non_nullable
              as FullScreenGestureMode,
      enablePlayerControlAnimation: null == enablePlayerControlAnimation
          ? _value.enablePlayerControlAnimation
          : enablePlayerControlAnimation // ignore: cast_nullable_to_non_nullable
              as bool,
      actionTypeSort: null == actionTypeSort
          ? _value._actionTypeSort
          : actionTypeSort // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isOpenDanmu: null == isOpenDanmu
          ? _value.isOpenDanmu
          : isOpenDanmu // ignore: cast_nullable_to_non_nullable
              as bool,
      blockTypes: null == blockTypes
          ? _value._blockTypes
          : blockTypes // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      showArea: null == showArea
          ? _value.showArea
          : showArea // ignore: cast_nullable_to_non_nullable
              as double,
      opacityVal: null == opacityVal
          ? _value.opacityVal
          : opacityVal // ignore: cast_nullable_to_non_nullable
              as double,
      fontSizeVal: null == fontSizeVal
          ? _value.fontSizeVal
          : fontSizeVal // ignore: cast_nullable_to_non_nullable
              as double,
      danmakuDurationVal: null == danmakuDurationVal
          ? _value.danmakuDurationVal
          : danmakuDurationVal // ignore: cast_nullable_to_non_nullable
              as double,
      strokeWidth: null == strokeWidth
          ? _value.strokeWidth
          : strokeWidth // ignore: cast_nullable_to_non_nullable
              as double,
      playRepeat: null == playRepeat
          ? _value.playRepeat
          : playRepeat // ignore: cast_nullable_to_non_nullable
              as PlayRepeat,
      playbackSpeed: null == playbackSpeed
          ? _value.playbackSpeed
          : playbackSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      enableAutoLongPressSpeed: null == enableAutoLongPressSpeed
          ? _value.enableAutoLongPressSpeed
          : enableAutoLongPressSpeed // ignore: cast_nullable_to_non_nullable
              as bool,
      longPressSpeed: null == longPressSpeed
          ? _value.longPressSpeed
          : longPressSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      speedsList: null == speedsList
          ? _value._speedsList
          : speedsList // ignore: cast_nullable_to_non_nullable
              as List<double>,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoData?,
    ));
  }
}

/// @nodoc

class _$AppSettingsImpl implements _AppSettings {
  const _$AppSettingsImpl(
      {required this.imgQuality,
      required this.fullScreenGestureMode,
      required this.enablePlayerControlAnimation,
      required final List<String> actionTypeSort,
      required this.isOpenDanmu,
      required final List<dynamic> blockTypes,
      required this.showArea,
      required this.opacityVal,
      required this.fontSizeVal,
      required this.danmakuDurationVal,
      required this.strokeWidth,
      required this.playRepeat,
      required this.playbackSpeed,
      required this.enableAutoLongPressSpeed,
      required this.longPressSpeed,
      required final List<double> speedsList,
      this.userInfo})
      : _actionTypeSort = actionTypeSort,
        _blockTypes = blockTypes,
        _speedsList = speedsList;

  @override
  final int imgQuality;
  @override
  final FullScreenGestureMode fullScreenGestureMode;
  @override
  final bool enablePlayerControlAnimation;
  final List<String> _actionTypeSort;
  @override
  List<String> get actionTypeSort {
    if (_actionTypeSort is EqualUnmodifiableListView) return _actionTypeSort;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_actionTypeSort);
  }

// 弹幕相关
  @override
  final bool isOpenDanmu;
  final List<dynamic> _blockTypes;
  @override
  List<dynamic> get blockTypes {
    if (_blockTypes is EqualUnmodifiableListView) return _blockTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blockTypes);
  }

  @override
  final double showArea;
  @override
  final double opacityVal;
  @override
  final double fontSizeVal;
  @override
  final double danmakuDurationVal;
  @override
  final double strokeWidth;
// 播放器相关
  @override
  final PlayRepeat playRepeat;
  @override
  final double playbackSpeed;
  @override
  final bool enableAutoLongPressSpeed;
  @override
  final double longPressSpeed;
  final List<double> _speedsList;
  @override
  List<double> get speedsList {
    if (_speedsList is EqualUnmodifiableListView) return _speedsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_speedsList);
  }

// 用户信息
  @override
  final UserInfoData? userInfo;

  @override
  String toString() {
    return 'AppSettings(imgQuality: $imgQuality, fullScreenGestureMode: $fullScreenGestureMode, enablePlayerControlAnimation: $enablePlayerControlAnimation, actionTypeSort: $actionTypeSort, isOpenDanmu: $isOpenDanmu, blockTypes: $blockTypes, showArea: $showArea, opacityVal: $opacityVal, fontSizeVal: $fontSizeVal, danmakuDurationVal: $danmakuDurationVal, strokeWidth: $strokeWidth, playRepeat: $playRepeat, playbackSpeed: $playbackSpeed, enableAutoLongPressSpeed: $enableAutoLongPressSpeed, longPressSpeed: $longPressSpeed, speedsList: $speedsList, userInfo: $userInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingsImpl &&
            (identical(other.imgQuality, imgQuality) ||
                other.imgQuality == imgQuality) &&
            (identical(other.fullScreenGestureMode, fullScreenGestureMode) ||
                other.fullScreenGestureMode == fullScreenGestureMode) &&
            (identical(other.enablePlayerControlAnimation,
                    enablePlayerControlAnimation) ||
                other.enablePlayerControlAnimation ==
                    enablePlayerControlAnimation) &&
            const DeepCollectionEquality()
                .equals(other._actionTypeSort, _actionTypeSort) &&
            (identical(other.isOpenDanmu, isOpenDanmu) ||
                other.isOpenDanmu == isOpenDanmu) &&
            const DeepCollectionEquality()
                .equals(other._blockTypes, _blockTypes) &&
            (identical(other.showArea, showArea) ||
                other.showArea == showArea) &&
            (identical(other.opacityVal, opacityVal) ||
                other.opacityVal == opacityVal) &&
            (identical(other.fontSizeVal, fontSizeVal) ||
                other.fontSizeVal == fontSizeVal) &&
            (identical(other.danmakuDurationVal, danmakuDurationVal) ||
                other.danmakuDurationVal == danmakuDurationVal) &&
            (identical(other.strokeWidth, strokeWidth) ||
                other.strokeWidth == strokeWidth) &&
            (identical(other.playRepeat, playRepeat) ||
                other.playRepeat == playRepeat) &&
            (identical(other.playbackSpeed, playbackSpeed) ||
                other.playbackSpeed == playbackSpeed) &&
            (identical(
                    other.enableAutoLongPressSpeed, enableAutoLongPressSpeed) ||
                other.enableAutoLongPressSpeed == enableAutoLongPressSpeed) &&
            (identical(other.longPressSpeed, longPressSpeed) ||
                other.longPressSpeed == longPressSpeed) &&
            const DeepCollectionEquality()
                .equals(other._speedsList, _speedsList) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      imgQuality,
      fullScreenGestureMode,
      enablePlayerControlAnimation,
      const DeepCollectionEquality().hash(_actionTypeSort),
      isOpenDanmu,
      const DeepCollectionEquality().hash(_blockTypes),
      showArea,
      opacityVal,
      fontSizeVal,
      danmakuDurationVal,
      strokeWidth,
      playRepeat,
      playbackSpeed,
      enableAutoLongPressSpeed,
      longPressSpeed,
      const DeepCollectionEquality().hash(_speedsList),
      userInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      __$$AppSettingsImplCopyWithImpl<_$AppSettingsImpl>(this, _$identity);
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {required final int imgQuality,
      required final FullScreenGestureMode fullScreenGestureMode,
      required final bool enablePlayerControlAnimation,
      required final List<String> actionTypeSort,
      required final bool isOpenDanmu,
      required final List<dynamic> blockTypes,
      required final double showArea,
      required final double opacityVal,
      required final double fontSizeVal,
      required final double danmakuDurationVal,
      required final double strokeWidth,
      required final PlayRepeat playRepeat,
      required final double playbackSpeed,
      required final bool enableAutoLongPressSpeed,
      required final double longPressSpeed,
      required final List<double> speedsList,
      final UserInfoData? userInfo}) = _$AppSettingsImpl;

  @override
  int get imgQuality;
  @override
  FullScreenGestureMode get fullScreenGestureMode;
  @override
  bool get enablePlayerControlAnimation;
  @override
  List<String> get actionTypeSort;
  @override // 弹幕相关
  bool get isOpenDanmu;
  @override
  List<dynamic> get blockTypes;
  @override
  double get showArea;
  @override
  double get opacityVal;
  @override
  double get fontSizeVal;
  @override
  double get danmakuDurationVal;
  @override
  double get strokeWidth;
  @override // 播放器相关
  PlayRepeat get playRepeat;
  @override
  double get playbackSpeed;
  @override
  bool get enableAutoLongPressSpeed;
  @override
  double get longPressSpeed;
  @override
  List<double> get speedsList;
  @override // 用户信息
  UserInfoData? get userInfo;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingsImplCopyWith<_$AppSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
