import 'package:hive/hive.dart';
import 'package:pilipala/utils/storage.dart';
import 'package:pilipala/models/user/info.dart';
import 'package:pilipala/plugin/pl_player/models/play_repeat.dart';
import 'package:pilipala/models/common/gesture_mode.dart';
import 'app_settings.dart';

class SettingsRepository {
  SettingsRepository({
    required this.settingBox,
    required this.localCacheBox,
    required this.videoStorageBox,
    required this.userInfoCacheBox,
  });

  final Box settingBox;
  final Box localCacheBox;
  final Box videoStorageBox;
  final Box userInfoCacheBox;

  /// 一次性加载所有设置（Hive get() 是同步的，无需 await）
  Future<AppSettings> load() async {
    // 图片质量
    final imgQuality = settingBox.get(
      SettingBoxKey.defaultPicQa,
      defaultValue: 10,
    ) as int;

    // 全屏手势模式
    final fsModeIndex = settingBox.get(
      SettingBoxKey.fullScreenGestureMode,
      defaultValue: FullScreenGestureMode.values.last.index,
    ) as int;
    final fullScreenGestureMode = FullScreenGestureMode.values[fsModeIndex];

    final enablePlayerControlAnimation = settingBox.get(
      SettingBoxKey.enablePlayerControlAnimation,
      defaultValue: true,
    ) as bool;

    final actionTypeSort = List<String>.from(
      settingBox.get(
        SettingBoxKey.actionTypeSort,
        defaultValue: ['like', 'coin', 'collect', 'watchLater', 'share'],
      ),
    );

    // 弹幕相关
    final isOpenDanmu = settingBox.get(
      SettingBoxKey.enableShowDanmaku,
      defaultValue: false,
    ) as bool;

    final blockTypes = List<dynamic>.from(
      localCacheBox.get(LocalCacheKey.danmakuBlockType, defaultValue: []),
    );
    final showArea = localCacheBox.get(
      LocalCacheKey.danmakuShowArea,
      defaultValue: 0.5,
    ) as double;
    final opacityVal = localCacheBox.get(
      LocalCacheKey.danmakuOpacity,
      defaultValue: 1.0,
    ) as double;
    final fontSizeVal = localCacheBox.get(
      LocalCacheKey.danmakuFontScale,
      defaultValue: 1.0,
    ) as double;
    final danmakuDurationVal = localCacheBox.get(
      LocalCacheKey.danmakuDuration,
      defaultValue: 4.0,
    ) as double;
    final strokeWidth = localCacheBox.get(
      LocalCacheKey.strokeWidth,
      defaultValue: 1.5,
    ) as double;

    // 播放器相关
    final playRepeatValue = videoStorageBox.get(
      VideoBoxKey.playRepeat,
      defaultValue: PlayRepeat.pause.value,
    );
    final playRepeat = PlayRepeat.values.firstWhere(
      (e) => e.value == playRepeatValue,
      orElse: () => PlayRepeat.pause,
    );

    final playbackSpeed = videoStorageBox.get(
      VideoBoxKey.playSpeedDefault,
      defaultValue: 1.0,
    ) as double;

    final enableAutoLongPressSpeed = settingBox.get(
      SettingBoxKey.enableAutoLongPressSpeed,
      defaultValue: false,
    ) as bool;

    final longPressSpeed = enableAutoLongPressSpeed
        ? 2.0
        : (videoStorageBox.get(
            VideoBoxKey.longPressSpeedDefault,
            defaultValue: 2.0,
          ) as double);

    final customSpeeds = List<double>.from(
      videoStorageBox.get(
        VideoBoxKey.customSpeedsList,
        defaultValue: <double>[],
      ),
    );

    final systemSpeeds = List<double>.from(
      videoStorageBox.get(
        VideoBoxKey.playSpeedSystem,
        defaultValue: [playbackSpeed], // 修复原代码潜在默认值问题
      ),
    );

    final speedsList = [...customSpeeds, ...systemSpeeds];

    final userInfo = userInfoCacheBox.get('userInfoCache') as UserInfoData?;

    return AppSettings(
      imgQuality: imgQuality,
      fullScreenGestureMode: fullScreenGestureMode,
      enablePlayerControlAnimation: enablePlayerControlAnimation,
      actionTypeSort: actionTypeSort,
      isOpenDanmu: isOpenDanmu,
      blockTypes: blockTypes,
      showArea: showArea,
      opacityVal: opacityVal,
      fontSizeVal: fontSizeVal,
      danmakuDurationVal: danmakuDurationVal,
      strokeWidth: strokeWidth,
      playRepeat: playRepeat,
      playbackSpeed: playbackSpeed,
      enableAutoLongPressSpeed: enableAutoLongPressSpeed,
      longPressSpeed: longPressSpeed,
      speedsList: speedsList,
      userInfo: userInfo,
    );
  }

  /// 通用更新方法（未来扩展非常方便）
  Future<void> updateSetting<T>({
    required String boxName,
    required String key,
    required T value,
  }) async {
    final box = _getBox(boxName);
    await box.put(key, value);
  }

  Box _getBox(String boxName) {
    switch (boxName) {
      case 'setting':
        return settingBox;
      case 'localCache':
        return localCacheBox;
      case 'video':
        return videoStorageBox;
      case 'userInfo':
        return userInfoCacheBox;
      default:
        throw ArgumentError('未知 Box: $boxName');
    }
  }
}
