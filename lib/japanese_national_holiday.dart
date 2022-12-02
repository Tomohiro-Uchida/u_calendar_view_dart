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
      holiday.holidayName = S.of(context).ganjitsu;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSeijin_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.january) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).seijin_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKenkokukinen_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.february) &&
        (date.day == 11)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).kenkokukinen_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSyunbun_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.march) &&
        (date.day == getSyunbunbi(date))) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).syunbun_no_hi;
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

  Holiday getShowa_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.april) &&
        (date.day == 29)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).showa_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSokui_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if (2019 == (date.year) && // 2018/10/22追記
        (date.month == DateTime.may) &&
        (date.day == 1)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).sokui_no_hi;
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
      holiday.holidayName = S.of(context).kenpokinenbi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getMidori_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 4)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).midori_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKodomo_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.may) &&
        (date.day == 5)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).kodomo_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getUmi_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year == 2021) && // 2020/12/04追記
        (date.month == DateTime.july) &&
        (date.day == 22)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).umi_no_hi;
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).umi_no_hi;
      return holiday;
    } else if (2014 <= date.year &&
        (date.year != 2021) && // 2020/12/4追記
        (date.year != 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (getWeekOfMonth(date) == 3) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).umi_no_hi;
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getYama_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year == 2021) && // 2020/12/4追記
        (date.month == DateTime.august) &&
        (date.day == 8)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).yama_no_hi;
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.august) &&
        (date.day == 10)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).yama_no_hi;
      return holiday;
    } else if (2014 <= date.year &&
        (date.year != 2021) && // 2020/12/4追記
        (date.year != 2020) && // 2018/10/22追記
        (date.month == DateTime.august) &&
        (date.day == 11)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).yama_no_hi;
      return holiday;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }
  }

  Holiday getKeiro_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.september) &&
        (getWeekOfMonth(date) == 3) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).keiro_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSyubun_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.september) &&
        (date.day == getSyubunbi(date))) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).syubun_no_hi;
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
  
  Holiday getSport_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if (2022 <= (date.year) && // 2020/12/4追記
        (date.month == DateTime.october) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).sport_no_hi;
      return holiday;
    } else if ((date.year == 2021) && // 2020/12/4追記
        (date.month == DateTime.july) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).sport_no_hi;
      return holiday;
    } else if ((date.year == 2020) && // 2018/10/22追記
        (date.month == DateTime.july) &&
        (date.day == 24)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).sport_no_hi;
      return holiday;
    }
    if (2014 <= (date.year) &&
        (date.year <= 2019) && // 2018/10/22追記
        (date.month == DateTime.october) &&
        (getWeekOfMonth(date) == 2) &&
        (date.weekday == DateTime.monday)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).taiiku_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getSokui_reiseiden_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if (2019 == (date.year) && // 2018/10/22追記
        (date.month == DateTime.october) &&
        (date.day == 22)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).sokui_reiseiden_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getBunka_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.november) &&
        (date.day == 3)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).bunka_no_hi;
    } else {
      holiday.isHoliday = false;
      holiday.holidayName = " ";
    }
    return holiday;
  }

  Holiday getKinrokansya_no_hi(DateTime date) {
    Holiday holiday = Holiday();
    if ((date.year >= 2014) &&
        (date.month == DateTime.november) &&
        (date.day == 23)) {
      holiday.isHoliday = true;
      holiday.holidayName = S.of(context).kinrokansya_no_hi;
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
        holiday.holidayName = S.of(context).tennotanjobi;
      } else {
        holiday.isHoliday = false;
        holiday.holidayName = " ";
      }
      return holiday;
    } else if (2014 <= date.year) {
      if ((date.month == DateTime.december) && (date.day == 23)) {
        holiday.isHoliday = true;
        holiday.holidayName = S.of(context).tennotanjobi;
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
    holiday = getSeijin_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKenkokukinen_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSyunbun_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getShowa_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSokui_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKenpokinenbi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getMidori_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKodomo_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getUmi_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getYama_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKeiro_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSyubun_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSport_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getSokui_reiseiden_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getBunka_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getKinrokansya_no_hi(date);
    if (holiday.isHoliday) return holiday;
    holiday = getTennotanjobi(date);
    if (holiday.isHoliday) return holiday;

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }

  Holiday getFurikae_kyujitsu(DateTime date) {
    Holiday holiday;

    DateTime date1 = DateTime(date.year, date.month, date.day, 0, 0, 0, 0, 0);

    do {
      date1.add(const Duration(days: -1));
      holiday = getRestrictHoliday(date1);
      if (holiday.isHoliday && (date1.weekday == DateTime.sunday)) {
        holiday.holidayName = S.of(context).furikae_kyujitsu;
        return holiday;
      }
    } while (holiday.isHoliday);

    holiday.isHoliday = false;
    holiday.holidayName = " ";
    return holiday;
  }

  Holiday getKokumin_no_kyujitsu(DateTime date) {
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
      holiday.holidayName = S.of(context).kokumin_no_kyujitsu;
      return holiday;
    }

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }

  Holiday getHoliday(DateTime? date) {
    Holiday holiday;

    Locale locale = Localizations.localeOf(context);;
    if (locale.languageCode != "ja" || date == null) {
      holiday = Holiday();
      holiday.isHoliday = false;
      holiday.holidayName = " ";
      return holiday;
    }

    holiday = getRestrictHoliday(date);
    if (holiday.isHoliday) return holiday;

    holiday = getFurikae_kyujitsu(date);
    if (holiday.isHoliday) return holiday;

    holiday = getKokumin_no_kyujitsu(date);
    if (holiday.isHoliday) return holiday;

    holiday.isHoliday = false;
    holiday.holidayName = " ";

    return holiday;
  }
}
