import 'dart:io' as io;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:pilipala/http/constants.dart';
import 'package:pilipala/http/init.dart';

class SetCookie {
  static Future<void> onSet() async {
    final cookieManager = CookieManager.instance();
    var rawCookies1 = await cookieManager.getCookies(
      url: WebUri(HttpString.baseUrl),
    );
    List<io.Cookie> ioCookies1 = rawCookies1
        .map((c) => io.Cookie(c.name, c.value.toString()))
        .toList();

    await Request.cookieManager.cookieJar.saveFromResponse(
      Uri.parse(HttpString.baseUrl),
      ioCookies1,
    );

    var cookieString = ioCookies1
        .map((cookie) => '${cookie.name}=${cookie.value}')
        .join('; ');
    Request.dio.options.headers['cookie'] = cookieString;

    var rawCookies2 = await cookieManager.getCookies(
      url: WebUri(HttpString.apiBaseUrl),
    );
    List<io.Cookie> ioCookies2 = rawCookies2
        .map((c) => io.Cookie(c.name, c.value.toString()))
        .toList();

    await Request.cookieManager.cookieJar.saveFromResponse(
      Uri.parse(HttpString.apiBaseUrl),
      ioCookies2,
    );

    var rawCookies3 = await cookieManager.getCookies(
      url: WebUri(HttpString.tUrl),
    );
    List<io.Cookie> ioCookies3 = rawCookies3
        .map((c) => io.Cookie(c.name, c.value.toString()))
        .toList();

    await Request.cookieManager.cookieJar.saveFromResponse(
      Uri.parse(HttpString.tUrl),
      ioCookies3,
    );
  }
}
