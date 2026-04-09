import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pilipala/models/user/info.dart';
import 'package:pilipala/plugin/pl_player/models/play_repeat.dart';
import 'package:pilipala/models/common/gesture_mode.dart';

part 'app_settings.freezed.dart';

@freezed
class AppSettings with _$AppSettings {
  const factory AppSettings({
    required int imgQuality,
    required FullScreenGestureMode fullScreenGestureMode,
    required bool enablePlayerControlAnimation,
    required List<String> actionTypeSort,
    // 弹幕相关
    required bool isOpenDanmu,
    required List<dynamic> blockTypes,
    required double showArea,
    required double opacityVal,
    required double fontSizeVal,
    required double danmakuDurationVal,
    required double strokeWidth,
    // 播放器相关
    required PlayRepeat playRepeat,
    required double playbackSpeed,
    required bool enableAutoLongPressSpeed,
    required double longPressSpeed,
    required List<double> speedsList,
    // 用户信息
    UserInfoData? userInfo,
  }) = _AppSettings;
}
