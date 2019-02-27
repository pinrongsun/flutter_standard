import 'package:scoped_model/scoped_model.dart';

mixin LanguageScopedModel on Model {
  String _locale = 'km';
  void onChangeLanguage() {
    if (_locale == 'en') {
      _locale = 'km';
    } else {
      _locale = 'en';
    }
    notifyListeners();
  }

  String get locale => _locale;
}
