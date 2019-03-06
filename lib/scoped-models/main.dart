import 'package:scoped_model/scoped_model.dart';

import './scoped_user.dart';
import './scoped_language.dart';
import '../models/user.dart';

class MainScopedModel extends Model with UserScopedModel, LanguageScopedModel {
  bool _isLoading = false;
  void loading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}
