import 'dart:core';

import 'package:flutter/material.dart';
import 'package:u_calendar_view_dart/u_calendar_view_dart.dart';

class Holiday {
  bool isHoliday = false;
  String holidayName = " ";
}

class JapaneseNationalHoliday {
  BuildContext context;
  Map<String, dynamic> lang;

  JapaneseNationalHoliday(this.context, this.lang);

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

  Holiday getGanjitsu(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.january) &&
        (date.day == 1)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["ganjitsu"]!=null) ? lang["ganjitsu"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSeijinNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.january) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["seijinNoHi"]!=null) ? lang["seijinNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKenkokukinenNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.february) &&
        (date.day == 11)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["kenkokukinenNoHi"]!=null) ? lang["kenkokukinenNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSyunbunNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.march) &&
        (date.day == getSyunbunbi(date))) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["syunbunNoHi"]!=null) ? lang["syunbunNoHi"] : "";
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

  Holiday getShowaNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.april) &&
        (date.day == 29)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["showaNoHi"]!=null) ? lang["showaNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSokuiNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if (2019 == (date.year) && // 2018/10/22追記
        (date.month == DateTime.may) &&
        (date.day == 1)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["sokuiNoHi"]!=null) ? lang["sokuiNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKenpokinenbi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 3)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["kenpokinenbi"]!=null) ? lang["kenpokinenbi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getMidoriNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 4)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["midoriNoHi"]!=null) ? lang["midoriNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKodomoNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 5)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["kodomoNoHi"]!=null) ? lang["kodomoNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getUmiNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year == 2021) && // 2020/12/04追記
        (date.month == DateTime.july) &&
        (date.day == 22)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["umiNoHi"]!=null) ? lang["umiNoHi"] : "";
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["umiNoHi"]!=null) ? lang["umiNoHi"] : "";
      return holiday;
    } else if (2014 <= date.year &&
        (date.year != 2021) && // 2020/12/4追記
        (date.year != 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (getWeekOfMonth(date) == 3) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["umiNoHi"]!=null) ? lang["umiNoHi"] : "";
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getYamaNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year == 2021) && // 2020/12/4追記
        (date.month == DateTime.august) &&
        (date.day == 8)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["yamaNoHi"]!=null) ? lang["yamaNoHi"] : "";
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.august) &&
        (date.day == 10)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["yamaNoHi"]!=null) ? lang["yamaNoHi"] : "";
      return holiday;
    } else if (2014 <= date.year &&
        (date.year != 2021) && // 2020/12/4追記
        (date.year != 2020) && // 2018/10/22追記
        (date.month == DateTime.august) &&
        (date.day == 11)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["yamaNoHi"]!=null) ? lang["yamaNoHi"] : "";
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getKeiroNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.september) &&
        (getWeekOfMonth(date) == 3) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["keiroNoHi"]!=null) ? lang["keiroNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSyubunNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.september) &&
        (date.day == getSyubunbi(date))) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["syubunNoHi"]!=null) ? lang["syubunNoHi"] : "";
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
  
  Holiday getSportNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if (2022 <= (date.year) && // 2020/12/4追記
        (date.month == DateTime.october) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["sportsNoHi"]!=null) ? lang["sportsNoHi"] : "";
      return holiday;
    } else if ((date.year == 2021) && // 2020/12/4追記
        (date.month == DateTime.july) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["sportsNoHi"]!=null) ? lang["sportsNoHi"] : "";
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (date.day == 24)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["sportsNoHi"]!=null) ? lang["sportsNoHi"] : "";
      return holiday;
    }
    if (2014 <= (date.year) &&
        (date.year <= 2019) && // 2018/10/22追記
        (date.month == DateTime.october) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["taiikuNoHi"]!=null) ? lang["taiikuNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSokuiReiseidenNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if (2019 == (date.year) && // 2018/10/22追記
        (date.month == DateTime.october) &&
        (date.day == 22)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["sokuiReiseidenNoHi"]!=null) ? lang["sokuiReiseidenNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getBunkaNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.november) &&
        (date.day == 3)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["bunkaNoHi"]!=null) ? lang["bunkaNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKinrokansyaNoHi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.november) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["kinrokansyaNoHi"]!=null) ? lang["kinrokansyaNoHi"] : "";
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getTennotanjobi(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    DateTime cal20190501 = DateTime(2019, 5, 1, 0, 0, 0, 0, 0);
    if (cal20190501.compareTo(date) <= 0) {
      if ((date.month == DateTime.february) && (date.day == 23)) {
        holiday.isHoliday = true;
        holiday.holidayName = (lang["tennotanjobi"]!=null) ? lang["tennotanjobi"] : "";
      } else {
        holiday.isHoliday = false;
        holiday.holidayName = " ";
      }
      return holiday;
    } else if (2014 <= date.year) {
      if ((date.month == DateTime.december) && (date.day == 23)) {
        holiday.isHoliday = true;
        holiday.holidayName = (lang["tennotanjobi"]!=null) ? lang["tennotanjobi"] : "";
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

  Holiday getRestrictHoliday(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday;

    holiday = getGanjitsu(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getSeijinNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getKenkokukinenNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getSyunbunNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getShowaNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getSokuiNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getKenpokinenbi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getMidoriNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getKodomoNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getUmiNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getYamaNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getKeiroNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getSyubunNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getSportNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getSokuiReiseidenNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getBunkaNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getKinrokansyaNoHi(date, lang);
    if (holiday.isHoliday) return holiday;
    holiday = getTennotanjobi(date, lang);
    if (holiday.isHoliday) return holiday;

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }

  Holiday getFurikaeKyujitsu(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday;

    DateTime date1 = DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);

    do {
      date1 = date1.add(const Duration(days: -1));
      holiday = getRestrictHoliday(date1, lang);
      if (holiday.isHoliday && (date1.weekday == DateTime.sunday)) {
        holiday.holidayName = (lang["furikaeKyujitsu"]!=null) ? lang["furikaeKyujitsu"] : "";
        return holiday;
      }
    } while (holiday.isHoliday);

    holiday.isHoliday = false;
    holiday.holidayName = " ";
    return holiday;
  }

  Holiday getKokuminNoKyujitsu(DateTime date, Map<String, dynamic> lang) {
    Holiday holiday = Holiday();
    Holiday holidayYesterday;
    Holiday holidayTomorrow;

    DateTime dateYesterday =
        DateTime(date.year, date.month, date.day - 1, 0, 0, 0, 0, 0);

    DateTime dateTomorrow =
        DateTime(date.year, date.month, date.day + 1, 0, 0, 0, 0, 0);

    holidayYesterday = getRestrictHoliday(dateYesterday, lang);
    holidayTomorrow = getRestrictHoliday(dateTomorrow, lang);

    if (holidayYesterday.isHoliday && holidayTomorrow.isHoliday) {
      holiday.isHoliday = true;
      holiday.holidayName = (lang["kokuminNoKyujitsu"]!=null) ? lang["kokuminNoKyujitsu"] : "";
      return holiday;
    }

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }

  Holiday getHoliday(DateTime? date, Map<String, dynamic> lang) {
    Holiday holiday;

    Locale locale = Localizations.localeOf(context);
    if (locale.languageCode != "ja" || date == null) {
      holiday = Holiday();
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }

    holiday = getRestrictHoliday(date, lang);
    if (holiday.isHoliday) return holiday;

    holiday = getFurikaeKyujitsu(date, lang);
    if (holiday.isHoliday) return holiday;

    holiday = getKokuminNoKyujitsu(date, lang);
    if (holiday.isHoliday) return holiday;

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }
}
