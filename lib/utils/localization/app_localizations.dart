import 'dart:async' show Future;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import './constants.dart' show languages;

class Translate {
  final Map<String, Map<String, String>> localizedValues;
  Translate(this.locale, this.localizedValues);

  final Locale locale;

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  String get hello {
    return localizedValues[locale.languageCode]['hello'];
  }

  greetTo(name) {
    return localizedValues[locale.languageCode]['greetTo']
        .replaceAll('{{name}}', name);
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<Translate> {
  Map<String, Map<String, String>> localizedValues;

  MyLocalizationsDelegate(this.localizedValues);

  @override
  bool isSupported(Locale locale) => languages.contains(locale.languageCode);

  @override
  Future<Translate> load(Locale locale) {
    return SynchronousFuture<Translate>(
        Translate(locale, localizedValues));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}

class FallbackCupertinoLocalisationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalisationsDelegate();

  @override
  bool isSupported(Locale locale) => true;

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      DefaultCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(FallbackCupertinoLocalisationsDelegate old) => false;
}