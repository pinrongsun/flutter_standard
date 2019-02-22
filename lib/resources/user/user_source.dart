import 'dart:async';
import '../../models/auth.dart';

abstract class UserSource {

  Future<Map<String, dynamic>> userAuthenticateByEmail(String email, String password, AuthMode mode);
}
