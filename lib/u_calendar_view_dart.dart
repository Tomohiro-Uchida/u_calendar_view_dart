import 'dart:core';

import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'u_calendar_view_dart_platform_interface.dart';

enum Alignment { leading, trailing }

class UCEntry {
  String applicationTag = "";
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);
  String leftLabel = "";
  Color leftLabelColor = const Color(0xFFFFFFFF);
  String middleLabel = "";
  Color middleLabelColor = const Color(0xFFFFFFFF);
  String value = "";
  Color valueColor = const Color(0xFFFFFFFF);
  String unit = "";
  Color unitColor = const Color(0xFFFFFFFF);
  String rightLabel = "";
  Color rightLabelColor = const Color(0xFFFFFFFF);
  double tableFontSize = 10.0;
  double listFontSize = 12.0;
  Alignment tableAlignment = Alignment.leading;
}

class EntryList {
  int maxLinesInDay = 3;
  List<UCEntry> entries = List.empty(growable: true);
}

EntryList entryList = EntryList();

class UCDate extends StatefulWidget {
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);

  UCDate(this.date, {super.key});

  @override
  _UCDateState createState() => _UCDateState();
}

class _UCDateState extends State<UCDate> {
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);

  @override
  initState() {
    super.initState();
    date = widget.date;
  }

  void setDate(DateTime date) {
    setState(() {
      this.date = date;
    });
  }

  DateTime getDate() {
    return date;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text('${date.day}', textAlign: TextAlign.start),
    );
  }
}

class UCDayEntry extends StatefulWidget {
  String dayEntry = "";

  UCDayEntry(this.dayEntry, {super.key});

  @override
  _UCDayEntryState createState() => _UCDayEntryState();
}

class _UCDayEntryState extends State<UCDayEntry> {
  String dayEntry = "";

  @override
  initState() {
    super.initState();
    dayEntry = widget.dayEntry;
  }

  void setDayEntry(String dayEntry) {
    setState(() {
      this.dayEntry = dayEntry;
    });
  }

  String getDayEntry() {
    return dayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Text(dayEntry, maxLines: 1);
  }
}

class UCDay extends StatefulWidget {
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);

  UCDay(this.date, {super.key});

  @override
  _UCDayState createState() => _UCDayState();
}

class _UCDayState extends State<UCDay> {
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);
  List<UCEntry> entriesOfTheDay = List.empty(growable: true);

  @override
  initState() {
    super.initState();
    date = widget.date;
    entriesOfTheDay = getEntriesOfTheDay(date, entryList.maxLinesInDay);
  }

  List<UCEntry> getEntriesOfTheDay(DateTime date, int max) {
    List<UCEntry> retVal = List.empty(growable: true);
    UCEntry element;
    for (element in entryList.entries) {
      DateTime resetTime = DateTime(element.date.year, element.date.month,
          element.date.day, 0, 0, 0, 0, 0);
      if (resetTime == date) {
        retVal.add(element);
      }
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    int i;
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: Column(children: <Widget>[
              UCDate(date),
              for (i = 0;
                  i < entryList.maxLinesInDay && i < entriesOfTheDay.length;
                  i++) ...{UCDayEntry(entriesOfTheDay[i].value)},
              for (int j = i; j < entryList.maxLinesInDay; j++) ...{
                UCDayEntry("        ")
              }
            ])));
  }
}

class WeekLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> weekLabels = [
      S.of(context).sun,
      S.of(context).mon,
      S.of(context).tue,
      S.of(context).wed,
      S.of(context).thu,
      S.of(context).fri,
      S.of(context).sat
    ];
    return Row(children: <Widget>[
      for (String label in weekLabels) ...{
        Expanded(
            child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(label, textAlign: TextAlign.center)))
      }
    ]);
  }
}

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var date = this;
    final firstDayOfTheMonth = DateTime(date.year, date.month, 1);
    int sum = firstDayOfTheMonth.weekday - 1 + date.day;
    if (sum % 7 == 0) {
      return sum ~/ 7;
    } else {
      return sum ~/ 7 + 1;
    }
  }
}

int normalCalcOfWeekOfMonth(int thisMonth, DateTime day) {
  int minus = DateTime.now().day - 1;
  DateTime previousMonth = day.add(Duration(days: minus));
  DateTime day1st =
      DateTime(previousMonth.year, previousMonth.month, 1, 0, 0, 0, 0, 0);
  DateTime lastDay =
      DateTime(day1st.year, day1st.month + 1, 1).add(const Duration(days: -1));
  int weekOfLastDay = lastDay.weekOfMonth;
  int weekOfDay = day.weekOfMonth;
  int weekdayOfLastDay = lastDay.weekOfMonth;
  if (weekdayOfLastDay == 7) {
    return weekOfLastDay + weekOfDay;
  } else {
    return weekOfLastDay + weekOfDay - 1;
  }
}

int getWeekOfMonth(int thisMonth, DateTime day) {
  int monthOfDay = day.day;
  if (thisMonth == 12) {
    if (monthOfDay == 11) {
      return 1;
    } else if (monthOfDay == 1) {
      return normalCalcOfWeekOfMonth(thisMonth, day);
    } else {
      return day.weekOfMonth;
    }
  } else if (thisMonth == 1) {
    if (monthOfDay == 12) {
      return 1;
    } else if (monthOfDay == 2) {
      return normalCalcOfWeekOfMonth(thisMonth, day);
    } else {
      return day.weekOfMonth;
    }
  } else {
    if (monthOfDay < thisMonth) {
      return 1;
    } else if (thisMonth < monthOfDay) {
      return normalCalcOfWeekOfMonth(thisMonth, day);
    } else {
      return day.weekOfMonth;
    }
  }
}

DateTime startDateInMonth(DateTime month) {
  DateTime startDate =
      DateTime(DateTime.now().year, DateTime.now().month, 1, 0, 0, 0, 0, 0);
  return startDate.add(Duration(days: -(startDate.weekday % 7)));
}

DateTime endDateInMonth(DateTime month) {
  DateTime startDate = startDateInMonth(month);
  return startDate.add(const Duration(days: 7 * 6));
}

class UCMonth extends StatefulWidget {
  DateTime month = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);

  UCMonth(this.month, {super.key});

  @override
  _UCMonthState createState() => _UCMonthState();
}

class _UCMonthState extends State<UCMonth> {
  DateTime month = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);

  @override
  initState() {
    super.initState();
    month = widget.month;
  }

  @override
  Widget build(BuildContext context) {
    DateTime startDate = startDateInMonth(month);
    return Column(children: <Widget>[
      WeekLabel(),
      for (int i = 0; i < 6; i++) ...{
        Row(children: <Widget>[
          for (int j = 0; j < 7; j++) ...{
            UCDay(startDate.add(Duration(days: i * 7 + j)))
          }
        ])
      }
    ]);
  }
}

class UCalendarViewDart {
  Future<String?> getPlatformVersion() {
    return UCalendarViewDartPlatform.instance.getPlatformVersion();
  }

  Widget getView(DateTime month, int maxLinesInDay, List<UCEntry> ucEntries) {
    entryList.maxLinesInDay = maxLinesInDay;
    entryList.entries = ucEntries;
    return UCMonth(month);
  }
}
