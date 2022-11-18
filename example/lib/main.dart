import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:u_calendar_view_dart/generated/l10n.dart';
import 'package:u_calendar_view_dart/u_calendar_view_dart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _uCalendarViewDartPlugin = UCalendarViewDart();

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initEntries();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _uCalendarViewDartPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  List<UCEntry> ucEntries = List.empty(growable: true);

  void initEntries() {
    for (int i=0; i<7*6; i++) {
      for (int j=0; j<3; j++) {
        UCEntry entry = UCEntry();
        entry.date = DateTime.now().add(Duration(days: i));
        entry.value = "VAL$i-$j";
        ucEntries.add(entry);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: _uCalendarViewDartPlugin.getView(DateTime.now(), 3, ucEntries)
      ),
    );
  }
}
