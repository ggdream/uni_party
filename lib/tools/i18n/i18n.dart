import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class I18n {
  I18n._();

  static final List<LocalizationsDelegate> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = [
    const Locale('zh', 'CN'),
  ];
}
