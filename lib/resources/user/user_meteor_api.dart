import 'dart:convert';
import 'dart:async';
import '../../models/auth.dart';
import 'package:http/http.dart' as http;
import 'user_source.dart';

class UserMeteorApi implements UserSource {
  @override
  Future<Map<String, dynamic>> userAuthenticateByEmail(String email, String password, AuthMode mode) {
    // TODO: implement userAuthenticateByEmail
    return null;
  }


}
