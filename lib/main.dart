import 'dart:io';

import 'package:base/util/util.dart';
import 'package:base/util/util_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'device/home.dart';

void main() {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RouterUtil routeObserver = RouterUtil.getInstance();
    Util.context = context;
    return MaterialApp(
      title: 'BLE蓝牙助手',
      darkTheme: ThemeData(platform: TargetPlatform.iOS, brightness: Brightness.dark),
      theme: ThemeData(platform: TargetPlatform.iOS, brightness: Brightness.light),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: HomePage(),
      //导航键
      navigatorKey: RouterUtil.navigatorKey,
      //导航监听
      navigatorObservers: [routeObserver],
    );
  }
}
