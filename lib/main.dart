import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:the_technology_maker/pages/home_page.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
  handleErrors();
}

void handleErrors() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log("Flutter error Report -> ${details.context}");
    log("Flutter error Exception -> ${details.exception}");
    log("Flutter error silent ? -> ${details.silent}");
    log("Flutter error Library -> ${details.library}");
    log("Flutter error -> ${details.informationCollector} ${details.stackFilter}");
    debugPrintStack(stackTrace: details.stack);
    if (kReleaseMode) {
      exit(1);
    }
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrintStack(stackTrace: stack);
    log("Platform Error -> $error");
    if (kReleaseMode) {
      exit(1);
    }
    return true;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khelo.com',
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
          bottomAppBarTheme: const BottomAppBarTheme(color: Colors.black)),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
