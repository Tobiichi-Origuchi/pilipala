import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:pilipala/http/user.dart';
import 'package:pilipala/pages/dynamics/index.dart';
import 'package:pilipala/pages/home/index.dart';
import 'package:pilipala/pages/media/index.dart';
import 'package:pilipala/pages/mine/index.dart';
import 'package:pilipala/utils/cookie.dart';
import 'package:pilipala/utils/storage.dart';
import 'package:uuid/uuid.dart';

class LoginUtils {
  static Future refreshLoginStatus(bool status) async {
    if (Get.isRegistered<MineController>()) {
      try {
        final mineCtr = Get.find<MineController>();
        await mineCtr.resetUserInfo();
        mineCtr.userLogin.value = status;
      } catch (e) {
        debugPrint('Update MineController failed: $e');
      }
    }

    if (Get.isRegistered<HomeController>()) {
      try {
        final homeCtr = Get.find<HomeController>();
        homeCtr.updateLoginStatus(status);
      } catch (e) {
        debugPrint('Update HomeController failed: $e');
      }
    }

    if (Get.isRegistered<DynamicsController>()) {
      Get.find<DynamicsController>().userLogin.value = status;
    }

    if (Get.isRegistered<MediaController>()) {
      Get.find<MediaController>().userLogin.value = status;
    }
  }

  static String buvid() {
    var mac = <String>[];
    var random = Random();
    for (var i = 0; i < 6; i++) {
      var min = 0;
      var max = 0xff;
      var num = (random.nextInt(max - min + 1) + min).toRadixString(16);
      mac.add(num.padLeft(2, '0'));
    }
    var md5Str = md5.convert(utf8.encode(mac.join(':'))).toString();
    var md5Arr = md5Str.split('');
    return 'XY${md5Arr[2]}${md5Arr[12]}${md5Arr[22]}$md5Str';
  }

  static String getUUID() {
    return const Uuid().v4().replaceAll('-', '');
  }

  static String generateBuvid() {
    String uuid = getUUID() + getUUID();
    return 'XY${uuid.substring(0, 35).toUpperCase()}';
  }

  static Future confirmLogin(url, controller) async {
    var content = url != null ? '$url; \n' : '';

    try {
      await SetCookie.onSet();
      final result = await UserHttp.userInfo();

      if (result['status'] && result['data'].isLogin) {
        SmartDialog.showToast('登录成功');

        try {
          Box userInfoCache;
          if (Hive.isBoxOpen('userInfo')) {
            userInfoCache = Hive.box('userInfo');
          } else {
            userInfoCache = await Hive.openBox('userInfo');
            GStrorage.userInfo = userInfoCache;
          }
          await userInfoCache.put('userInfoCache', result['data']);

          if (Get.isRegistered<HomeController>()) {
            final HomeController homeCtr = Get.find<HomeController>();
            homeCtr.updateLoginStatus(true);
            homeCtr.userFace.value = result['data'].face;
          }

          if (Get.isRegistered<MediaController>()) {
            final MediaController mediaCtr = Get.find<MediaController>();
            mediaCtr.mid = result['data'].mid;
          }

          await refreshLoginStatus(true);
        } catch (err) {
          SmartDialog.show(builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('登录遇到问题'),
              content: Text(err.toString()),
              actions: [
                TextButton(
                  onPressed: controller != null
                      ? () => controller.reload()
                      : SmartDialog.dismiss,
                  child: const Text('确认'),
                )
              ],
            );
          });
        }
        Get.back();
      } else {
        // 获取用户信息失败
        SmartDialog.showToast(result['msg']);
        Clipboard.setData(ClipboardData(text: result['msg']));
      }
    } catch (e) {
      SmartDialog.showNotify(msg: e.toString(), notifyType: NotifyType.warning);
      content = content + e.toString();
      Clipboard.setData(ClipboardData(text: content));
    }
  }
}
