import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'settings_repository.dart';
import 'app_settings.dart';
import 'package:pilipala/utils/storage.dart';
import 'package:pilipala/models/user/info.dart';
import 'package:pilipala/models/common/gesture_mode.dart';

part 'settings_provider.g.dart';

@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return SettingsRepository(
    settingBox: GStrorage.setting,
    localCacheBox: GStrorage.localCache,
    videoStorageBox: GStrorage.video,
    userInfoCacheBox: GStrorage.userInfo,
  );
}

@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  late final SettingsRepository _repository;

  @override
  Future<AppSettings> build() async {
    _repository = ref.watch(settingsRepositoryProvider);
    return _repository.load();
  }

  /// ==================== 更新方法 ====================

  Future<void> setImgQuality(int value) async {
    await _repository.updateSetting(
      boxName: 'setting',
      key: SettingBoxKey.defaultPicQa,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(imgQuality: value));
    }
  }

  Future<void> setFullScreenGestureMode(FullScreenGestureMode value) async {
    await _repository.updateSetting(
      boxName: 'setting',
      key: SettingBoxKey.fullScreenGestureMode,
      value: value.index,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(fullScreenGestureMode: value));
    }
  }

  Future<void> setEnablePlayerControlAnimation(bool value) async {
    await _repository.updateSetting(
      boxName: 'setting',
      key: SettingBoxKey.enablePlayerControlAnimation,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(enablePlayerControlAnimation: value));
    }
  }

  Future<void> setActionTypeSort(List<String> value) async {
    await _repository.updateSetting(
      boxName: 'setting',
      key: SettingBoxKey.actionTypeSort,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(actionTypeSort: value));
    }
  }

  Future<void> setIsOpenDanmu(bool value) async {
    await _repository.updateSetting(
      boxName: 'setting',
      key: SettingBoxKey.enableShowDanmaku,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(isOpenDanmu: value));
    }
  }

  Future<void> setDanmakuOpacity(double value) async {
    await _repository.updateSetting(
      boxName: 'localCache',
      key: LocalCacheKey.danmakuOpacity,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(opacityVal: value));
    }
  }

  Future<void> setDanmakuFontScale(double value) async {
    await _repository.updateSetting(
      boxName: 'localCache',
      key: LocalCacheKey.danmakuFontScale,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(fontSizeVal: value));
    }
  }

  Future<void> setPlaybackSpeed(double value) async {
    await _repository.updateSetting(
      boxName: 'video',
      key: VideoBoxKey.playSpeedDefault,
      value: value,
    );
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(playbackSpeed: value));
    }
  }

  Future<void> setUserInfo(UserInfoData? user) async {
    if (user == null) {
      await GStrorage.userInfo.delete('userInfoCache');
    } else {
      await GStrorage.userInfo.put('userInfoCache', user);
    }
    final current = state.value;
    if (current != null) {
      state = AsyncData(current.copyWith(userInfo: user));
    }
  }
}
