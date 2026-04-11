import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:pilipala/utils/route_push.dart';
import '../http/search.dart';
import 'id_utils.dart';
import 'url_utils.dart';
import 'utils.dart';

class PiliSchame {
  static final AppLinks _appLinks = AppLinks();
  static StreamSubscription<Uri>? _linkSubscription;

  static Future<void> init() async {
    /// 1. 获取冷启动时的 Scheme
    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
      if (initialUri != null) {
        _routePush(initialUri);
      }
    } catch (e) {
      debugPrint('AppLinks 冷启动获取失败: $e');
    }

    /// 2. 注册在后台运行时的 Scheme 唤醒监听
    _linkSubscription = _appLinks.uriLinkStream.listen(
      (Uri uri) {
        _routePush(uri);
      },
      onError: (err) {
        debugPrint('AppLinks 监听流错误: $err');
      },
    );
  }

  /// 路由统一分发中心
  static void _routePush(Uri uri) async {
    final String scheme = uri.scheme;
    final String host = uri.host;
    final String path = uri.path;

    if (scheme == 'bilibili') {
      switch (host) {
        case 'root':
          Navigator.popUntil(
            Get.context!,
            (Route<dynamic> route) => route.isFirst,
          );
          break;
        case 'space':
          final String mid = path.split('/').last;
          Get.toNamed<dynamic>(
            '/member?mid=$mid',
            arguments: <String, dynamic>{'face': null},
          );
          break;
        case 'video':
          String pathQuery = path.split('/').last;
          final numericRegex = RegExp(r'^[0-9]+$');
          if (numericRegex.hasMatch(pathQuery)) {
            pathQuery = 'AV$pathQuery';
          }
          Map map = IdUtils.matchAvorBv(input: pathQuery);
          if (map.containsKey('AV')) {
            _videoPush(map['AV'], null);
          } else if (map.containsKey('BV')) {
            _videoPush(null, map['BV']);
          } else {
            SmartDialog.showToast('投稿匹配失败');
          }
          break;
        case 'live':
          final String roomId = path.split('/').last;
          Get.toNamed<dynamic>(
            '/liveRoom?roomid=$roomId',
            arguments: <String, String?>{'liveItem': null, 'heroTag': roomId},
          );
          break;
        case 'bangumi':
          if (path.startsWith('/season')) {
            final String seasonId = path.split('/').last;
            RoutePush.bangumiPush(int.parse(seasonId), null);
          }
          break;
        case 'opus':
          if (path.startsWith('/detail')) {
            var opusId = path.split('/').last;
            Get.toNamed(
              '/opus',
              parameters: {'title': '', 'id': opusId, 'articleType': 'opus'},
            );
          }
          break;
        case 'search':
          Get.toNamed('/searchResult', parameters: {'keyword': ''});
          break;
        case 'article':
          final String id = path.split('/').last.split('?').first;
          Get.toNamed(
            '/read',
            parameters: {'title': 'cv$id', 'id': id, 'dynamicType': 'read'},
          );
          break;
        case 'pgc':
          if (path.contains('ep')) {
            final String lastPathSegment = path.split('/').last;
            RoutePush.bangumiPush(
              null,
              int.parse(lastPathSegment.split('?').first),
            );
          }
          break;
        default:
          SmartDialog.showToast('未匹配地址，请联系开发者');
          Clipboard.setData(ClipboardData(text: uri.toString()));
          break;
      }
    }

    // 处理标准 http/https 链接
    if (scheme == 'https' || scheme == 'http') {
      fullPathPush(uri);
    }
  }

  // 投稿跳转 (保持不变)
  static Future<void> _videoPush(int? aidVal, String? bvidVal) async {
    SmartDialog.showLoading<dynamic>(msg: '获取中...');
    try {
      int? aid = aidVal;
      String? bvid = bvidVal;
      if (aidVal == null) {
        aid = IdUtils.bv2av(bvidVal!);
      }
      if (bvidVal == null) {
        bvid = IdUtils.av2bv(aidVal!);
      }
      final int cid = await SearchHttp.ab2c(bvid: bvidVal, aid: aidVal);
      final String heroTag = Utils.makeHeroTag(aid);
      SmartDialog.dismiss<dynamic>().then(
        (e) => Get.toNamed<dynamic>(
          '/video?bvid=$bvid&cid=$cid',
          arguments: <String, String?>{'pic': '', 'heroTag': heroTag},
        ),
      );
    } catch (e) {
      SmartDialog.showToast('video获取失败: $e');
    }
  }

  // HTTP/HTTPS 完整路径分发
  static Future<void> fullPathPush(Uri uri) async {
    final String host = uri.host;
    final String path = uri.path;
    final Map<String, String> query = uri.queryParameters;
    final String dataString = uri.toString(); // 替代了原来的 value.dataString

    RegExp regExp = RegExp(r'^((www\.)|(m\.))?bilibili\.com$');
    if (regExp.hasMatch(host)) {
      final String lastPathSegment = path.split('/').last;
      if (path.startsWith('/video')) {
        Map matchRes = IdUtils.matchAvorBv(input: path);
        if (matchRes.containsKey('AV')) {
          _videoPush(matchRes['AV']! as int, null);
        } else if (matchRes.containsKey('BV')) {
          _videoPush(null, matchRes['BV'] as String);
        } else {
          SmartDialog.showToast('投稿匹配失败');
        }
      }
      if (path.startsWith('/bangumi')) {
        if (lastPathSegment.contains('ss')) {
          RoutePush.bangumiPush(Utils.matchNum(lastPathSegment).first, null);
        }
        if (lastPathSegment.contains('ep')) {
          RoutePush.bangumiPush(null, Utils.matchNum(lastPathSegment).first);
        }
      } else if (path.startsWith('/BV')) {
        final String bvid = path.split('/').last;
        _videoPush(null, bvid);
      } else if (path.startsWith('/av')) {
        _videoPush(Utils.matchNum(path).first, null);
      }
    } else if (host.contains('live')) {
      int roomId = int.parse(path.split('/').last);
      Get.toNamed(
        '/liveRoom?roomid=$roomId',
        arguments: {'liveItem': null, 'heroTag': roomId.toString()},
      );
    } else if (host.contains('space')) {
      var mid = path.split('/').last;
      Get.toNamed('/member?mid=$mid', arguments: {'face': ''});
      return;
    } else if (host == 'b23.tv') {
      final String redirectUrl = await UrlUtils.parseRedirectUrl(dataString);
      final String pathSegment = Uri.parse(redirectUrl).path;
      final String lastPathSegment = pathSegment.split('/').last;
      final RegExp avRegex = RegExp(r'^[aA][vV]\d+', caseSensitive: false);
      if (avRegex.hasMatch(lastPathSegment)) {
        final Map<String, dynamic> map = IdUtils.matchAvorBv(
          input: lastPathSegment,
        );
        if (map.containsKey('AV')) {
          _videoPush(map['AV']! as int, null);
        } else if (map.containsKey('BV')) {
          _videoPush(null, map['BV'] as String);
        } else {
          SmartDialog.showToast('投稿匹配失败');
        }
      } else if (lastPathSegment.startsWith('ep')) {
        _handleEpisodePath(lastPathSegment, redirectUrl);
      } else if (lastPathSegment.startsWith('ss')) {
        _handleSeasonPath(lastPathSegment, redirectUrl);
      } else if (lastPathSegment.startsWith('BV')) {
        UrlUtils.matchUrlPush(lastPathSegment, '', redirectUrl);
      } else {
        Get.toNamed(
          '/webview',
          parameters: {'url': redirectUrl, 'type': 'url', 'pageTitle': ''},
        );
      }
    } else if (path.isNotEmpty) {
      final String area = path.split('/').last;
      switch (area) {
        case 'bangumi':
          debugPrint('番剧');
          if (area.startsWith('ep')) {
            RoutePush.bangumiPush(null, Utils.matchNum(area).first);
          } else if (area.startsWith('ss')) {
            RoutePush.bangumiPush(Utils.matchNum(area).first, null);
          }
          break;
        case 'video':
          debugPrint('投稿');
          final Map<String, dynamic> map = IdUtils.matchAvorBv(input: path);
          if (map.containsKey('AV')) {
            _videoPush(map['AV']! as int, null);
          } else if (map.containsKey('BV')) {
            _videoPush(null, map['BV'] as String);
          } else {
            SmartDialog.showToast('投稿匹配失败');
          }
          break;
        case 'read':
          debugPrint('专栏');
          if (query.containsKey('id')) {
            String id = Utils.matchNum(query['id']!).first.toString();
            Get.toNamed(
              '/read',
              parameters: {
                'url': dataString,
                'title': '',
                'id': id,
                'articleType': 'read',
              },
            );
          }
          break;
        case 'space':
          debugPrint('个人空间');
          Get.toNamed('/member?mid=$area', arguments: {'face': ''});
          break;
        default:
          final Map<String, dynamic> map = IdUtils.matchAvorBv(input: area);
          if (map.containsKey('AV')) {
            _videoPush(map['AV']! as int, null);
          } else if (map.containsKey('BV')) {
            _videoPush(null, map['BV'] as String);
          } else {
            Get.toNamed(
              '/webview',
              parameters: {'url': dataString, 'type': 'url', 'pageTitle': ''},
            );
          }
          break;
      }
    }
  }

  static void _handleEpisodePath(String lastPathSegment, String redirectUrl) {
    final String seasonId = _extractIdFromPath(lastPathSegment);
    RoutePush.bangumiPush(null, Utils.matchNum(seasonId).first);
  }

  static void _handleSeasonPath(String lastPathSegment, String redirectUrl) {
    final String seasonId = _extractIdFromPath(lastPathSegment);
    RoutePush.bangumiPush(Utils.matchNum(seasonId).first, null);
  }

  static String _extractIdFromPath(String lastPathSegment) {
    return lastPathSegment.split('/').last;
  }

  // 资源释放
  static void dispose() {
    _linkSubscription?.cancel();
  }
}
