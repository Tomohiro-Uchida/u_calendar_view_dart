import 'package:flutter/material.dart';
import 'dart:async';

import 'package:u_calendar_view_dart/generated/l10n.dart';
import 'package:u_calendar_view_dart/u_calendar_view_dart.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class ValueAddPage extends StatefulWidget {
  const ValueAddPage({super.key});

  @override
  _ValueAddPageState createState() => _ValueAddPageState();
}

class _ValueAddPageState extends State<ValueAddPage> {
  String inputText = "";

  void _handleText(String input) {
    setState(() {
      inputText = input;
    });
    UCEntry ucEntry = UCEntry();
    ucEntry.applicationTag = const Uuid().v1();
    ucEntry.date = DateTime.now();
    ucEntry.leftLabel = "Left";
    ucEntry.leftLabelColor = Colors.amber;
    ucEntry.middleLabel = "Middle";
    ucEntry.middleLabelColor = Colors.green;
    ucEntry.unitStart = "\$";
    ucEntry.unitStartColor = Colors.indigo;
    ucEntry.value = inputText;
    ucEntry.valueColor = Colors.grey;
    ucEntry.unitEnd = "pcs";
    ucEntry.unitEndColor = Colors.red;
    ucEntry.rightLabel = "Right";
    ucEntry.rightLabelColor = Colors.yellow;
    ucEntry.tableFontSize = 14.0;
    ucEntry.listFontSize = 18.0;
    ucEntry.tableAlignment = Alignment.centerRight;
    Navigator.of(context).pop(ucEntry);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Value Add")),
        body: Container(
            padding: const EdgeInsets.all(30),
            child: TextField(
                decoration: const InputDecoration(
                  //paddingの設定
                  contentPadding: EdgeInsets.all(10),//任意の値を入れてpaddingを調節
                  //フォーカスしてないときの枠の設定
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  //フォーカスしてるときの枠の設定
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              onSubmitted: _handleText
            )
          )
        );
  }
}

Future<UCEntry?> ucOnAddEntry(BuildContext context) async {
  return await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ValueAddPage()));
}

void ucOnTapEntry(BuildContext context, UCEntry ucEntry) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(ucEntry.value),
  ));
}

void ucOnMonthChanged(BuildContext context, int prevYear, int prevMonth,
    int setYear, int setMonth) {}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _uCalendarViewDartPlugin = UCalendarViewDart();

  @override
  void initState() {
    super.initState();
    initEntries();
  }

  List<UCEntry> ucEntries = List.empty(growable: true);

  void initEntries() {
    for (int i = 0; i < 7 * 6; i++) {
      for (int j = 0; j < 1; j++) {
        UCEntry entry = UCEntry();
        entry.applicationTag = const Uuid().v1();
        entry.date = DateTime.now().add(Duration(days: i));
        entry.leftLabel = "Left";
        entry.leftLabelColor = Colors.amber;
        entry.middleLabel = "Middle";
        entry.middleLabelColor = Colors.green;
        entry.unitStart = "\$";
        entry.unitStartColor = Colors.indigo;
        entry.value = "VAL$i-$j";
        entry.valueColor = Colors.grey;
        entry.unitEnd = "pcs";
        entry.unitEndColor = Colors.red;
        entry.rightLabel = "Right";
        entry.rightLabelColor = Colors.yellow;
        entry.tableFontSize = 14.0;
        entry.listFontSize = 18.0;
        entry.tableAlignment = Alignment.centerRight;
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
            title: const Text('UCalendarView Sample app'),
          ),
          body: _uCalendarViewDartPlugin.getView(DateTime.now(), 3, ucEntries,
              ucOnAddEntry, ucOnTapEntry, ucOnMonthChanged)),
    );
  }
}
