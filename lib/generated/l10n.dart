// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `SU`
  String get sun {
    return Intl.message(
      'SU',
      name: 'sun',
      desc: '',
      args: [],
    );
  }

  /// `MO`
  String get mon {
    return Intl.message(
      'MO',
      name: 'mon',
      desc: '',
      args: [],
    );
  }

  /// `TU`
  String get tue {
    return Intl.message(
      'TU',
      name: 'tue',
      desc: '',
      args: [],
    );
  }

  /// `WE`
  String get wed {
    return Intl.message(
      'WE',
      name: 'wed',
      desc: '',
      args: [],
    );
  }

  /// `TH`
  String get thu {
    return Intl.message(
      'TH',
      name: 'thu',
      desc: '',
      args: [],
    );
  }

  /// `FR`
  String get fri {
    return Intl.message(
      'FR',
      name: 'fri',
      desc: '',
      args: [],
    );
  }

  /// `SA`
  String get sat {
    return Intl.message(
      'SA',
      name: 'sat',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ganjitsu {
    return Intl.message(
      '',
      name: 'ganjitsu',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get seijin_no_hi {
    return Intl.message(
      '',
      name: 'seijin_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kenkokukinen_no_hi {
    return Intl.message(
      '',
      name: 'kenkokukinen_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get syunbun_no_hi {
    return Intl.message(
      '',
      name: 'syunbun_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get showa_no_hi {
    return Intl.message(
      '',
      name: 'showa_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get sokui_no_hi {
    return Intl.message(
      '',
      name: 'sokui_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kenpokinenbi {
    return Intl.message(
      '',
      name: 'kenpokinenbi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get midori_no_hi {
    return Intl.message(
      '',
      name: 'midori_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kodomo_no_hi {
    return Intl.message(
      '',
      name: 'kodomo_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get umi_no_hi {
    return Intl.message(
      '',
      name: 'umi_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get yama_no_hi {
    return Intl.message(
      '',
      name: 'yama_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get keiro_no_hi {
    return Intl.message(
      '',
      name: 'keiro_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get syubun_no_hi {
    return Intl.message(
      '',
      name: 'syubun_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get taiiku_no_hi {
    return Intl.message(
      '',
      name: 'taiiku_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get sport_no_hi {
    return Intl.message(
      '',
      name: 'sport_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get sokui_reiseiden_no_hi {
    return Intl.message(
      '',
      name: 'sokui_reiseiden_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get bunka_no_hi {
    return Intl.message(
      '',
      name: 'bunka_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kinrokansya_no_hi {
    return Intl.message(
      '',
      name: 'kinrokansya_no_hi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get tennotanjobi {
    return Intl.message(
      '',
      name: 'tennotanjobi',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get furikae_kyujitsu {
    return Intl.message(
      '',
      name: 'furikae_kyujitsu',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get kokumin_no_kyujitsu {
    return Intl.message(
      '',
      name: 'kokumin_no_kyujitsu',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ja'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
