import 'dart:core';

import 'package:flutter/material.dart';
import 'package:u_calendar_view_dart/u_calendar_view_dart.dart';
import 'generated/l10n.dart';

class Holiday {
  bool isHoliday = false;
  String holidayName = " ";
}

class JapaneseNationalHoliday {
  BuildContext context;

  JapaneseNationalHoliday(this.context);

  int getWeekOfMonth(DateTime date) {
    int originalWeekOfMonth = date.weekOfMonth;
    if (date.month == DateTime(
        date.year,
        date.month,
        date.day-(originalWeekOfMonth-1)*7,
        date.hour,
        date.minute,
        date.second,
        date.microsecond,
        date.microsecond
    ).month) {
      return originalWeekOfMonth;
    } else {
      return originalWeekOfMonth - 1;
    }
  }

  Holiday getGanjitsu(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.january) &&
        (date.day == 1)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).ganjitsu;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSeijinNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.january) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).seijinNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKenkokukinenNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.february) &&
        (date.day == 11)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).kenkokukinenNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSyunbunNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.march) &&
        (date.day == getSyunbunbi(date))) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).syunbunNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  int getSyunbunbi(DateTime date) {
    // 2000年以降の春分日を計算
    int year = date.year;
    return (20.69115 + ((year - 2000) * 0.242194) - (year - 2000) ~/ 4).toInt();
  }

  Holiday getShowaNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.april) &&
        (date.day == 29)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).showaNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSokuiNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if (2019 == (date.year) && // 2018/10/22追記
        (date.month == DateTime.may) &&
        (date.day == 1)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).sokuiNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKenpokinenbi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 3)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).kenpokinenbi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getMidoriNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 4)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).midoriNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKodomoNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 5)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).kodomoNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getUmiNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year == 2021) && // 2020/12/04追記
        (date.month == DateTime.july) &&
        (date.day == 22)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).umiNoHi;
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).umiNoHi;
      return holiday;
    } else if (2014 <= date.year &&
        (date.year != 2021) && // 2020/12/4追記
        (date.year != 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (getWeekOfMonth(date) == 3) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).umiNoHi;
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getYamaNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year == 2021) && // 2020/12/4追記
        (date.month == DateTime.august) &&
        (date.day == 8)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).yamaNoHi;
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.august) &&
        (date.day == 10)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).yamaNoHi;
      return holiday;
    } else if (2014 <= date.year &&
        (date.year != 2021) && // 2020/12/4追記
        (date.year != 2020) && // 2018/10/22追記
        (date.month == DateTime.august) &&
        (date.day == 11)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).yamaNoHi;
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getKeiroNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.september) &&
        (getWeekOfMonth(date) == 3) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).keiroNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSyubunNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.september) &&
        (date.day == getSyubunbi(date))) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).syubunNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  int getSyubunbi(DateTime date) {
    // 2000年以降の秋分日を計算
    int year = date.year;
    return (23.09 + ((year - 2000) * 0.242194) - (year - 2000) ~/ 4).toInt();
  }
  
  Holiday getSportNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if (2022 <= (date.year) && // 2020/12/4追記
        (date.month == DateTime.october) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).sportsNoHi;
      return holiday;
    } else if ((date.year == 2021) && // 2020/12/4追記
        (date.month == DateTime.july) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).sportsNoHi;
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (date.day == 24)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).sportsNoHi;
      return holiday;
    }
    if (2014 <= (date.year) &&
        (date.year <= 2019) && // 2018/10/22追記
        (date.month == DateTime.october) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).taiikuNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSokuiReiseidenNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if (2019 == (date.year) && // 2018/10/22追記
        (date.month == DateTime.october) &&
        (date.day == 22)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).sokui_reiseidenNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getBunkaNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.november) &&
        (date.day == 3)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).bunkaNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKinrokansyaNoHi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.november) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).kinrokansyaNoHi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getTennotanjobi(DateTime date) {
    Holiday holiday = Holiday();
    DateTime cal20190501 = DateTime(2019, 5, 1, 0, 0, 0, 0, 0);
    if (cal20190501.compareTo(date) <= 0) {
      if ((date.month == DateTime.february) && (date.day == 23)) {
        holiday.isHoliday = true;
        holiday.holidayName = UCalendarViewL10n.of(context).tennotanjobi;
      } else {
        holiday.isHoliday = false;
        holiday.holidayName = " ";
      }
      return holiday;
    } else if (2014 <= date.year) {
      if ((date.month == DateTime.december) && (date.day == 23)) {
        holiday.isHoliday = true;
        holiday.holidayName = UCalendarViewL10n.of(context).tennotanjobi;
      } else {
        holiday.isHoliday = false;
        holiday.holidayName = " ";
      }
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getRestrictHoliday(DateTime date) {
    Holiday holiday;

    holiday = getGanjitsu(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSeijinNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKenkokukinenNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSyunbunNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getShowaNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSokuiNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKenpokinenbi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getMidoriNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKodomoNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getUmiNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getYamaNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKeiroNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSyubunNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSportNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSokuiReiseidenNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getBunkaNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKinrokansyaNoHi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getTennotanjobi(date);
    if (holiday.isHoliday) return holiday;

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }

  Holiday getFurikaeKyujitsu(DateTime date) {
    Holiday holiday;

    DateTime date1 = DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);

    do {
      date1.add(const Duration(days: -1));
      holiday = getRestrictHoliday(date1);
      if (holiday.isHoliday && (date1.weekday == DateTime.sunday)) {
        holiday.holidayName = UCalendarViewL10n.of(context).furikaeKyujitsu;
        return holiday;
      }
    } while (holiday.isHoliday);

    holiday.isHoliday = false;
    holiday.holidayName = " ";
    return holiday;
  }

  Holiday getKokuminNoKyujitsu(DateTime date) {
    Holiday holiday = Holiday();
    Holiday holidayYesterday;
    Holiday holidayTomorrow;

    DateTime dateYesterday =
        DateTime(date.year, date.month, date.day - 1, 0, 0, 0, 0, 0);

    DateTime dateTomorrow =
        DateTime(date.year, date.month, date.day + 1, 0, 0, 0, 0, 0);

    holidayYesterday = getRestrictHoliday(dateYesterday);
    holidayTomorrow = getRestrictHoliday(dateTomorrow);

    if (holidayYesterday.isHoliday && holidayTomorrow.isHoliday) {
      holiday.isHoliday = true;
      holiday.holidayName = UCalendarViewL10n.of(context).kokuminNoKyujitsu;
      return holiday;
    }

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }

  Holiday getHoliday(DateTime? date) {
    Holiday holiday;

    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode != "ja" || date == null) {
      holiday = Holiday();
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }

    holiday = getRestrictHoliday(date);
    if (holiday.isHoliday) return holiday;

    holiday = getFurikaeKyujitsu(date);
    if (holiday.isHoliday) return holiday;

    holiday = getKokuminNoKyujitsu(date);
    if (holiday.isHoliday) return holiday;

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }
}
