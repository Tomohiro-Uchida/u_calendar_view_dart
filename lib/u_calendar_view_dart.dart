import 'dart:core';

import 'package:flutter/material.dart';
import 'package:u_calendar_view_dart/japanese_national_holiday.dart';
import 'generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

List<UCEntry> getEntriesOfTheDay(
    DateTime date, int max, List<UCEntry> ucEntries) {
  List<UCEntry> retVal = List.empty(growable: true);
  UCEntry element;
  for (element in ucEntries) {
    DateTime resetTime = DateTime(
        element.date.year, element.date.month, element.date.day, 0, 0, 0, 0, 0);
    if (resetTime == date) {
      retVal.add(element);
    }
  }
  return retVal;
}
/*
class DateManager {
  DateTime month;
  DateTime startDate;
  DateTime selectedDate;
  Holiday selectedHoliday;

  DateManager(
      {required this.month,
      required this.startDate,
      required this.selectedDate,
      required this.selectedHoliday});
}

class DateManagerNotifier extends StateNotifier<DateManager> {
  DateManagerNotifier()
      : super(DateManager(
            month: DateTime(
                DateTime.now().year, DateTime.now().month, 1, 0, 0, 0, 0, 0),
            startDate: startDateInMonth(DateTime.now()),
            selectedDate: DateTime.now(),
            selectedHoliday: Holiday()));

  DateManager get() {
    return state;
  }

  void setMonth(DateTime month) {
    state = DateManager(
        month: month,
        startDate: state.startDate,
        selectedDate: state.selectedDate,
        selectedHoliday: state.selectedHoliday);
  }

  void setStartDate(DateTime startDate) {
    state = DateManager(
        month: state.month,
        startDate: startDate,
        selectedDate: state.selectedDate,
        selectedHoliday: state.selectedHoliday);
  }

  void setSelectedDate(DateTime selectedDate) {
    state = DateManager(
        month: state.month,
        startDate: state.startDate,
        selectedDate: selectedDate,
        selectedHoliday: state.selectedHoliday);
  }

  void setSelectedHoliday(Holiday selectedHoliday) {
    state = DateManager(
        month: state.month,
        startDate: state.startDate,
        selectedDate: state.selectedDate,
        selectedHoliday: selectedHoliday);
  }
}

final dateManagerProvider =
    StateNotifierProvider<DateManagerNotifier, DateManager>((ref) {
  return DateManagerNotifier();
});
 */

class MonthNotifier extends StateNotifier<DateTime> {
  MonthNotifier()
      : super(DateTime(
            DateTime.now().year, DateTime.now().month, 1, 0, 0, 0, 0, 0));

  DateTime get() {
    return state;
  }

  void set(DateTime month) {
    state = month;
  }
}

final monthProvider = StateNotifierProvider<MonthNotifier, DateTime>((ref) {
  return MonthNotifier();
});

class StartDateNotifier extends StateNotifier<DateTime> {
  StartDateNotifier() : super(startDateInMonth(DateTime.now()));

  DateTime get() {
    return state;
  }

  void set(DateTime startDate) {
    state = startDate;
  }
}

final startDateProvider =
    StateNotifierProvider<StartDateNotifier, DateTime>((ref) {
  return StartDateNotifier();
});

class SelectedDateNotifier extends StateNotifier<DateTime> {
  SelectedDateNotifier() : super(DateTime.now());

  DateTime get() {
    return state;
  }

  void set(DateTime selectedDate) {
    state = selectedDate;
  }
}

final selectedDateProvider =
    StateNotifierProvider<SelectedDateNotifier, DateTime>((ref) {
  return SelectedDateNotifier();
});

class SelectedHolidayNotifier extends StateNotifier<Holiday> {
  SelectedHolidayNotifier() : super(Holiday());

  Holiday get() {
    return state;
  }

  void set(Holiday selectedHoliday) {
    state = selectedHoliday;
  }
}

final selectedHolidayProvider =
    StateNotifierProvider<SelectedHolidayNotifier, Holiday>((ref) {
  return SelectedHolidayNotifier();
});

class UCEntryManagerNotifier extends StateNotifier<List<UCEntry>> {
  UCEntryManagerNotifier() : super([]);

  List<UCEntry> get() {
    return state;
  }

  void add(UCEntry ucEntry) {
    state = [...state, ucEntry];
  }
}

final ucEntryManagerProvider =
    StateNotifierProvider<UCEntryManagerNotifier, List<UCEntry>>((ref) {
  return UCEntryManagerNotifier();
});

class UCCoreTable extends ConsumerWidget {
  int maxLinesInDay;
  List<List<UCEntry>> entriesOfTheDay;
  DateTime date = DateTime.now();
  int lineToWrite = 0;

  UCCoreTable(
      {super.key, required this.maxLinesInDay, required this.entriesOfTheDay});

  Color getSelectedColor(
      DateTime startDate, DateTime selectedDate, int week, int weekday) {
    DateTime pointedDate = startDate.add(Duration(days: week * 7 + weekday));
    if (selectedDate.year == pointedDate.year &&
        selectedDate.month == pointedDate.month &&
        selectedDate.day == pointedDate.day) {
      return const Color(0xffb2ebf2);
    } else {
      return const Color(0x00ffffff);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime startDate = ref.watch(startDateProvider);
    DateTime selectedDate = ref.watch(selectedDateProvider);
    JapaneseNationalHoliday japaneseNationalHoliday =
        JapaneseNationalHoliday(context);
    List<Holiday> holidays = List.empty(growable: true);
    for (int week = 0; week < 6; week++) {
      for (int weekday = 0; weekday < 7; weekday++) {
        date = startDate.add(Duration(days: week * 7 + weekday));
        holidays.add(japaneseNationalHoliday.getHoliday(date));
      }
    }
    return Column(children: <Widget>[
      for (int week = 0; week < 6; week++) ...{
        Row(children: <Widget>[
          for (int weekday = 0; weekday < 7; weekday++) ...{
            Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      color: getSelectedColor(
                          startDate, selectedDate, week, weekday),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          ref.read(selectedDateProvider.notifier).set(startDate
                              .add(Duration(days: week * 7 + weekday)));
                          ref.read(selectedHolidayProvider.notifier).set(
                              japaneseNationalHoliday.getHoliday(selectedDate));
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
      }
    ]);
  }
}

class UCMonth extends ConsumerWidget {
  int maxLinesInDay;
  List<UCEntry> ucEntries;
  List<List<UCEntry>> entriesOfTheDay = List.empty(growable: true);

  final Future<UCEntry?> Function(BuildContext context) ucOnAddEntry;
  final Function(BuildContext context, UCEntry ucEntry) ucOnTapEntry;
  final Function(BuildContext context, int prevYear, int prevMonth, int setYear,
      int setMonth) ucOnMonthChanged;

  UCMonth(
      {super.key,
      required this.maxLinesInDay,
      required this.ucEntries,
      required this.ucOnAddEntry,
      required this.ucOnTapEntry,
      required this.ucOnMonthChanged});

  List<UCEntry> getEntriesOfTheDay(WidgetRef ref, DateTime date, int max) {
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
  Widget build(BuildContext context, WidgetRef ref) {
    DateTime thisMonth = ref.watch(monthProvider);
    DateTime startDate = ref.watch(startDateProvider);
    DateTime selectedDate = ref.watch(selectedDateProvider);
    Holiday selectedHoliday = ref.watch(selectedHolidayProvider);
    entriesOfTheDay.clear();
    for (int week = 0; week < 6; week++) {
      for (int weekday = 0; weekday < 7; weekday++) {
        DateTime date = startDate.add(Duration(days: week * 7 + weekday));
        entriesOfTheDay.add(getEntriesOfTheDay(ref, date, maxLinesInDay));
      }
    }
    return Column(children: <Widget>[
      Stack(
        children: <Widget>[
          Row(children: <Widget>[
            const Spacer(),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    DateTime previousMonth = thisMonth;
                    DateTime newMonth = DateTime(previousMonth.year,
                        previousMonth.month - 1, 1, 0, 0, 0, 0, 0);
                    ucOnMonthChanged(context, previousMonth.year,
                        previousMonth.month, newMonth.year, newMonth.month);
                    ref.read(monthProvider.notifier).set(newMonth);
                    ref
                        .read(startDateProvider.notifier)
                        .set(startDateInMonth(newMonth));
                  },
                  // 表示アイコン
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  // アイコン色
                  color: Colors.blue,
                )),
            Expanded(
                flex: 2,
                child: GestureDetector(
                    onTap: () {
                      Future<DateTime?> futureNewMonth = showDatePicker(
                        context: context,
                        //初期値を設定
                        initialDate: thisMonth,
                        //選択できる日付の上限
                        firstDate: DateTime(DateTime.now().year - 10),
                        lastDate: DateTime(DateTime.now().year + 10),
                      );
                      futureNewMonth.then((value) {
                        DateTime previousMonth = thisMonth;
                        if (value != null) {
                          DateTime newMonth = DateTime(
                              value.year, value.month, 1, 0, 0, 0, 0, 0);
                          ucOnMonthChanged(
                              context,
                              previousMonth.year,
                              previousMonth.month,
                              newMonth.year,
                              newMonth.month);
                          ref.read(monthProvider.notifier).set(newMonth);
                          ref
                              .read(startDateProvider.notifier)
                              .set(startDateInMonth(newMonth));
                        }
                      });
                    },
                    child: Text("${thisMonth.year}-${thisMonth.month}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.blue, fontSize: 25.0)))),
            Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    DateTime previousMonth = thisMonth;
                    DateTime newMonth = DateTime(previousMonth.year,
                        previousMonth.month + 1, 1, 0, 0, 0, 0, 0);
                    ucOnMonthChanged(context, previousMonth.year,
                        previousMonth.month, newMonth.year, newMonth.month);
                    ref.read(monthProvider.notifier).set(newMonth);
                    ref
                        .read(startDateProvider.notifier)
                        .set(startDateInMonth(newMonth));
                  },
                  // 表示アイコン
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                  // アイコン色
                  color: Colors.blue,
                )),
            const Spacer()
          ]),
          Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  DateTime previousMonth = thisMonth;
                  DateTime newMonth = DateTime(DateTime.now().year,
                      DateTime.now().month, 1, 0, 0, 0, 0, 0);
                  ucOnMonthChanged(context, previousMonth.year,
                      previousMonth.month, newMonth.year, newMonth.month);
                  ref.read(monthProvider.notifier).set(newMonth);
                  ref
                      .read(startDateProvider.notifier)
                      .set(startDateInMonth(newMonth));
                },
                icon: const Icon(Icons.calendar_today_rounded),
                color: Colors.blue,
              )),
        ],
      ),
      WeekLabel(),
      UCCoreTable(
          maxLinesInDay: maxLinesInDay,
          entriesOfTheDay: entriesOfTheDay,
          key: UniqueKey()),
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
                          newEntry.then((value) {
                            if (value != null) {
                              ref
                                  .read(ucEntryManagerProvider.notifier)
                                  .add(value);
                            }
                          });
                        },
                        icon: const Icon(Icons.add),
                        color: Colors.blue))),
            Expanded(
                child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(selectedHoliday.holidayName)))
          ])),
      Expanded(child: makeListView(thisMonth, startDate, selectedDate))
    ]);
  }

  Widget makeListView(
      DateTime thisMonth, DateTime startDate, DateTime selectedDate) {
    int diffDays = selectedDate.difference(startDate).inDays;
    return ListView.builder(
        itemExtent: 30.0,
        itemCount: entriesOfTheDay[diffDays].length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                ucOnTapEntry(context, entriesOfTheDay[diffDays][index]);
              },
              child: Stack(children: <Widget>[
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(entriesOfTheDay[diffDays][index].leftLabel,
                        style: TextStyle(
                            color:
                                entriesOfTheDay[diffDays][index].leftLabelColor,
                            fontSize: entriesOfTheDay[diffDays][index]
                                .listFontSize))),
                Container(
                    alignment: Alignment.center,
                    child: Text(entriesOfTheDay[diffDays][index].middleLabel,
                        style: TextStyle(
                            color: entriesOfTheDay[diffDays][index]
                                .middleLabelColor,
                            fontSize: entriesOfTheDay[diffDays][index]
                                .listFontSize))),
                Row(children: <Widget>[
                  const Spacer(),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(entriesOfTheDay[diffDays][index].unitStart,
                          style: TextStyle(
                              color: entriesOfTheDay[diffDays][index]
                                  .unitStartColor,
                              fontSize: entriesOfTheDay[diffDays][index]
                                  .listFontSize))),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(entriesOfTheDay[diffDays][index].value,
                          style: TextStyle(
                              color:
                                  entriesOfTheDay[diffDays][index].valueColor,
                              fontSize: entriesOfTheDay[diffDays][index]
                                  .listFontSize))),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(entriesOfTheDay[diffDays][index].unitEnd,
                          style: TextStyle(
                              color:
                                  entriesOfTheDay[diffDays][index].unitEndColor,
                              fontSize: entriesOfTheDay[diffDays][index]
                                  .listFontSize))),
                  Container(
                      alignment: Alignment.centerRight,
                      child: Text(entriesOfTheDay[diffDays][index].rightLabel,
                          style: TextStyle(
                              color: entriesOfTheDay[diffDays][index]
                                  .rightLabelColor,
                              fontSize: entriesOfTheDay[diffDays][index]
                                  .listFontSize)))
                ])
              ]));
        });
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
    return ProviderScope(
        child: UCMonth(
            maxLinesInDay: maxLinesInDay,
            ucEntries: ucEntries,
            ucOnAddEntry: ucOnAddEntry,
            ucOnTapEntry: ucOnTapEntry,
            ucOnMonthChanged: ucOnMonthChanged));
  }
}
