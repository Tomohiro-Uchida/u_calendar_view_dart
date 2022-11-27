import 'dart:core';

import 'package:flutter/material.dart';
import 'package:u_calendar_view_dart/japanese_national_holiday.dart';
import 'generated/l10n.dart';
import 'u_calendar_view_dart_platform_interface.dart';

const double defaultFontSize = 14.0;

class UCEntry {
  String applicationTag = "";
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);
  String leftLabel = "";
  Color leftLabelColor = const Color(0xFF000000);
  String middleLabel = "";
  Color middleLabelColor = const Color(0xFF000000);
  String unitStart = "";
  Color unitStartColor = const Color(0xFF000000);
  String value = "          ";
  Color valueColor = const Color(0xFF000000);
  String unitEnd = "";
  Color unitEndColor = const Color(0xFF000000);
  String rightLabel = "";
  Color rightLabelColor = const Color(0xFF000000);
  double tableFontSize = 14.0;
  double listFontSize = 18.0;
  Alignment tableAlignment = Alignment.centerLeft;
}

class EntryList {
  int maxLinesInDay = 3;
  List<UCEntry> entries = List.empty(growable: true);
}

// EntryList entryList = EntryList();

class UCDate extends StatefulWidget {
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);
  Holiday holiday = Holiday();

  UCDate(this.date, this.holiday, {super.key});

  @override
  _UCDateState createState() => _UCDateState();
}

class _UCDateState extends State<UCDate> {
  DateTime date = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);
  Holiday holiday = Holiday();

  @override
  initState() {
    super.initState();
    date = widget.date;
    holiday = widget.holiday;
  }

  void setDate(DateTime date) {
    setState(() {
      this.date = date;
    });
  }

  DateTime getDate() {
    return date;
  }

  Widget setDateAndWeekOfMonth(DateTime date, Holiday holiday) {
    Widget retVal;
    if (holiday.isHoliday || date.weekday == DateTime.sunday) {
      retVal = Text('${date.day}',
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.red, fontSize: defaultFontSize));
    } else if (date.weekday == DateTime.saturday) {
      retVal = Text('${date.day}',
          textAlign: TextAlign.start,
          style:
              const TextStyle(color: Colors.blue, fontSize: defaultFontSize));
    } else {
      retVal = Text('${date.day}',
          textAlign: TextAlign.start,
          style:
              const TextStyle(color: Colors.black, fontSize: defaultFontSize));
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    return setDateAndWeekOfMonth(date, holiday);
  }
}

class UCHoliday extends StatelessWidget {
  Holiday holiday = Holiday();

  UCHoliday(this.holiday, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(holiday.holidayName,
            maxLines: 1,
            overflow: TextOverflow.clip,
            style: const TextStyle(fontSize: defaultFontSize - 3.0)));
  }
}

class UCDayEntry extends StatefulWidget {
  UCEntry dayEntry = UCEntry();

  UCDayEntry(this.dayEntry, {super.key});

  @override
  _UCDayEntryState createState() => _UCDayEntryState();
}

class _UCDayEntryState extends State<UCDayEntry> {
  UCEntry dayEntry = UCEntry();

  @override
  initState() {
    super.initState();
    dayEntry = widget.dayEntry;
  }

  void setDayEntry(UCEntry dayEntry) {
    setState(() {
      this.dayEntry = dayEntry;
    });
  }

  UCEntry getDayEntry() {
    return dayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: dayEntry.tableAlignment,
      child: Text(dayEntry.value,
          maxLines: 1,
          style: TextStyle(
              fontSize: dayEntry.tableFontSize, color: dayEntry.valueColor)),
    );
  }
}

Widget setWeekLabels(BuildContext context, String label) {
  Widget retVal;
  if (label == S.of(context).sun) {
    retVal = Text(label,
        textAlign: TextAlign.center, style: const TextStyle(color: Colors.red));
  } else if (label == S.of(context).sat) {
    retVal = Text(label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.blue));
  } else {
    retVal = Text(label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black));
  }
  return retVal;
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
                child: setWeekLabels(context, label)))
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
  // int monthOfTheDay = day.day;
  int monthOfTheDay = day.month;
  if (thisMonth == 12) {
    if (monthOfTheDay == 11) {
      return 1;
    } else if (monthOfTheDay == 1) {
      return normalCalcOfWeekOfMonth(thisMonth, day);
    } else {
      return day.weekOfMonth;
    }
  } else if (thisMonth == 1) {
    if (monthOfTheDay == 12) {
      return 1;
    } else if (monthOfTheDay == 2) {
      return normalCalcOfWeekOfMonth(thisMonth, day);
    } else {
      return day.weekOfMonth;
    }
  } else {
    if (monthOfTheDay < thisMonth) {
      return 1;
    } else if (thisMonth < monthOfTheDay) {
      return normalCalcOfWeekOfMonth(thisMonth, day);
    } else {
      return day.weekOfMonth;
    }
  }
}

DateTime startDateInMonth(DateTime month) {
  DateTime startDate = DateTime(month.year, month.month, 1, 0, 0, 0, 0, 0);
  return startDate.add(Duration(days: -(startDate.weekday % 7)));
}

DateTime endDateInMonth(DateTime month) {
  DateTime startDate = startDateInMonth(month);
  return startDate.add(const Duration(days: 7 * 6));
}

class UCMonth extends StatefulWidget {
  int maxLinesInDay = 1;
  List<UCEntry> ucEntries = List.empty(growable: true);
  DateTime month = DateTime(2022, 1, 1, 0, 0, 0, 0, 0);

  final Future<UCEntry?> Function(BuildContext context) ucOnAddEntry;
  final Function(BuildContext context, UCEntry ucEntry) ucOnTapEntry;
  final Function(BuildContext context, int prevYear, int prevMonth, int setYear,
      int setMonth) ucOnMonthChanged;

  UCMonth(
      {super.key,
      required this.month,
      required this.maxLinesInDay,
      required this.ucEntries,
      required this.ucOnAddEntry,
      required this.ucOnTapEntry,
      required this.ucOnMonthChanged});

  @override
  _UCMonthState createState() => _UCMonthState();
}

class _UCMonthState extends State<UCMonth> {
  int maxLinesInDay = 1;
  List<UCEntry> ucEntries = List.empty(growable: true);
  DateTime month = DateTime.now();
  DateTime date = DateTime.now();
  late DateTime startDate;
  DateTime selectedDate = DateTime.now();
  Holiday selectedHoliday = Holiday();
  List<List<UCEntry>> entriesOfTheDay = List.empty(growable: true);
  late final Future<UCEntry?> Function(BuildContext context) ucOnAddEntry;
  late final Function(BuildContext context, UCEntry ucEntry) ucOnTapEntry;
  late final Function(BuildContext context, int prevYear, int prevMonth,
      int setYear, int setMonth) ucOnMonthChanged;

  @override
  initState() {
    super.initState();
    maxLinesInDay = widget.maxLinesInDay;
    ucEntries = widget.ucEntries;
    month = widget.month;
    date = DateTime.now();
    startDate = startDateInMonth(month);
    selectedDate = DateTime.now();
    selectedHoliday = Holiday();
    entriesOfTheDay = List.empty(growable: true);
    ucOnAddEntry = widget.ucOnAddEntry;
    ucOnTapEntry = widget.ucOnTapEntry;
    ucOnMonthChanged = widget.ucOnMonthChanged;
  }

  List<UCEntry> getEntriesOfTheDay(DateTime date, int max) {
    List<UCEntry> retVal = List.empty(growable: true);
    UCEntry element;
    for (element in ucEntries) {
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
    JapaneseNationalHoliday japaneseNationalHoliday =
        JapaneseNationalHoliday(context);
    List<Holiday> holidays = List.empty(growable: true);
    entriesOfTheDay.clear();
    for (int week = 0; week < 6; week++) {
      for (int weekday = 0; weekday < 7; weekday++) {
        date = startDate.add(Duration(days: week * 7 + weekday));
        holidays.add(japaneseNationalHoliday.getHoliday(date));
        entriesOfTheDay.add(getEntriesOfTheDay(date, maxLinesInDay));
      }
    }
    int lineToWrite = 0;
    return Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Row(children: <Widget>[
            const Spacer(),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      month = DateTime(
                          month.year, month.month - 1, 1, 0, 0, 0, 0, 0);
                      startDate = startDateInMonth(month);
                    });
                  },
                  // 表示アイコン
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  // アイコン色
                  color: Colors.blue,
                  // サイズ
                  // iconSize: 64,
                )),
            Expanded(
                flex: 2,
                child: GestureDetector(
                    onTap: () async {
                      DateTime newMonth = (await showDatePicker(
                        context: context,
                        //初期値を設定
                        initialDate: month,
                        //選択できる日付の上限
                        firstDate: DateTime(DateTime.now().year - 2),
                        lastDate: DateTime(DateTime.now().year + 2),
                      ))!;
                      newMonth = DateTime(
                          newMonth.year, newMonth.month, 1, 0, 0, 0, 0, 0);
                      setState(() {
                        month = newMonth;
                        startDate = startDateInMonth(month);
                      });
                    },
                    child: Text("${month.year}-${month.month}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.blue, fontSize: 25.0)))),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      month = DateTime(
                          month.year, month.month + 1, 1, 0, 0, 0, 0, 0);
                      startDate = startDateInMonth(month);
                    });
                  },
                  // 表示アイコン
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  // アイコン色
                  color: Colors.blue,
                  // サイズ
                  // iconSize: 64,
                )),
            const Spacer()
          ]),
          Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    month = DateTime(DateTime.now().year, DateTime.now().month,
                        1, 0, 0, 0, 0, 0);
                    startDate = startDateInMonth(month);
                  });
                },
                icon: const Icon(Icons.calendar_today_rounded),
                color: Colors.blue,
              )),
        ],
      ),
      WeekLabel(),
      for (int week = 0; week < 6; week++) ...{
        Row(children: <Widget>[
          for (int weekday = 0; weekday < 7; weekday++) ...{
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = startDate
                                .add(Duration(days: week * 7 + weekday));
                            selectedHoliday = japaneseNationalHoliday
                                .getHoliday(selectedDate);
                          });
                        },
                        child: Column(children: <Widget>[
                          Row(children: <Widget>[
                            UCDate(
                                startDate
                                    .add(Duration(days: week * 7 + weekday)),
                                holidays[week * 7 + weekday],
                                key: UniqueKey()),
                            UCHoliday(holidays[week * 7 + weekday],
                                key: UniqueKey())
                          ]),
                          for (lineToWrite = 0;
                              lineToWrite < maxLinesInDay &&
                                  lineToWrite <
                                      entriesOfTheDay[week * 7 + weekday]
                                          .length;
                              lineToWrite++) ...{
                            UCDayEntry(
                                entriesOfTheDay[week * 7 + weekday]
                                    [lineToWrite],
                                key: UniqueKey())
                          },
                          for (int lineWhite = lineToWrite;
                              lineWhite < maxLinesInDay;
                              lineWhite++) ...{
                            UCDayEntry(UCEntry(), key: UniqueKey())
                          }
                        ]))))
          }
        ])
      },
      Container(
          color: const Color.fromARGB(0xFF, 0xC0, 0xC0, 0xC0),
          child: Row(children: <Widget>[
            Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                        style: const TextStyle(fontSize: 18.0)))),
            Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: IconButton(
                        onPressed: () {
                          Future<UCEntry?> newEntry = ucOnAddEntry(context);
                          if (newEntry != null) {
                            newEntry.then((value) {
                              setState(() {
                                ucEntries.add(value!);
                              });
                            });
                          }
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.blue))),
            Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(selectedHoliday.holidayName)))
          ])),
      Expanded(
          child: ListView.builder(
              itemExtent: 30.0,
              itemCount:
                  entriesOfTheDay[selectedDate.difference(startDate).inDays]
                      .length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      ucOnTapEntry(
                          context,
                          entriesOfTheDay[selectedDate
                              .difference(startDate)
                              .inDays][index]);
                    },
                    child: Stack(children: <Widget>[
                      Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              entriesOfTheDay[selectedDate
                                      .difference(startDate)
                                      .inDays][index]
                                  .leftLabel,
                              style: TextStyle(
                                  color: entriesOfTheDay[selectedDate
                                          .difference(startDate)
                                          .inDays][index]
                                      .leftLabelColor,
                                  fontSize: entriesOfTheDay[selectedDate
                                          .difference(startDate)
                                          .inDays][index]
                                      .listFontSize))),
                      Container(
                          alignment: Alignment.center,
                          child: Text(
                              entriesOfTheDay[selectedDate
                                      .difference(startDate)
                                      .inDays][index]
                                  .middleLabel,
                              style: TextStyle(
                                  color: entriesOfTheDay[selectedDate
                                          .difference(startDate)
                                          .inDays][index]
                                      .middleLabelColor,
                                  fontSize: entriesOfTheDay[selectedDate
                                          .difference(startDate)
                                          .inDays][index]
                                      .listFontSize))),
                      Row(children: <Widget>[
                        const Spacer(),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                entriesOfTheDay[selectedDate
                                        .difference(startDate)
                                        .inDays][index]
                                    .unitStart,
                                style: TextStyle(
                                    color: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .unitStartColor,
                                    fontSize: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .listFontSize))),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                entriesOfTheDay[selectedDate
                                        .difference(startDate)
                                        .inDays][index]
                                    .value,
                                style: TextStyle(
                                    color: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .valueColor,
                                    fontSize: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .listFontSize))),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                entriesOfTheDay[selectedDate
                                        .difference(startDate)
                                        .inDays][index]
                                    .unitEnd,
                                style: TextStyle(
                                    color: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .unitEndColor,
                                    fontSize: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .listFontSize))),
                        Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                                entriesOfTheDay[selectedDate
                                        .difference(startDate)
                                        .inDays][index]
                                    .rightLabel,
                                style: TextStyle(
                                    color: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .rightLabelColor,
                                    fontSize: entriesOfTheDay[selectedDate
                                            .difference(startDate)
                                            .inDays][index]
                                        .listFontSize)))
                      ])
                    ]));
              }))
    ]);
  }
}

class UCalendarViewDart {
  Future<String?> getPlatformVersion() {
    return UCalendarViewDartPlatform.instance.getPlatformVersion();
  }

  Widget getView(
      DateTime month,
      int maxLinesInDay,
      List<UCEntry> ucEntries,
      Future<UCEntry?> Function(BuildContext context) ucOnAddEntry,
      Function(BuildContext context, UCEntry ucEntry) ucOnTapEntry,
      Function(BuildContext context, int prevYear, int prevMonth, int setYear,
              int setMonth)
          ucOnMonthChanged) {
    return UCMonth(
        month: month,
        maxLinesInDay: maxLinesInDay,
        ucEntries: ucEntries,
        ucOnAddEntry: ucOnAddEntry,
        ucOnTapEntry: ucOnTapEntry,
        ucOnMonthChanged: ucOnMonthChanged);
  }
}
