import 'package:scoped_model/scoped_model.dart';

import './scoped_user.dart';
import './scoped_language.dart';
import '../models/user.dart';

class MainScopedModel extends Model with UserScopedModel, LanguageScopedModel  {
}


