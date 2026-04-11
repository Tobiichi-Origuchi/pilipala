import 'dart:io';
import 'package:native_flutter_proxy/native_flutter_proxy.dart';
import 'package:flutter/foundation.dart';

class CustomProxy {
  Future<void> init() async {
    try {
      // 1. 获取当前系统的代理设置
      final settings = await NativeProxyReader.proxySetting;

      // 2. 初始化全局代理
      _applyProxy(settings);

      // 3. 监听系统代理动态切换
      NativeProxyReader.setProxyChangedCallback((newSettings) async {
        _applyProxy(newSettings);
      });
    } catch (e) {
      // 防止在某些不支持的定制安卓系统上崩溃
      debugPrint('获取系统代理失败: $e');
    }
  }

  void _applyProxy(ProxySetting settings) {
    if (settings.enabled && settings.host != null) {
      HttpOverrides.global = ProxiedHttpOverrides(
        settings.host!,
        settings.port?.toString() ?? '80',
      );
    } else {
      // 用户未开启系统代理，或中途关闭了代理，清空拦截恢复直连
      HttpOverrides.global = null;
    }
  }
}

class ProxiedHttpOverrides extends HttpOverrides {
  final String _host;
  final String _port;

  ProxiedHttpOverrides(this._host, this._port);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $_host:$_port;";
      };
  }
}
