import 'package:audioandvideo/core/logic/app_theme.dart';
import 'package:audioandvideo/core/logic/helper.dart';
import 'package:audioandvideo/views/play_music.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'audio player ',
        navigatorKey: navigatorKey,
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        home: PlayMusicView());
  }
}
