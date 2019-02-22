import 'dart:async';
import '../resources/user/user_source.dart';
import '../resources/user/user_firebase_api.dart';
import '../models/auth.dart';
import '../resources/user/user_meteor_api.dart';


class UserRepository {

  Future<Map<String, dynamic>> userAuthenticateByEmail(String email, String password, AuthMode mode){
    List<UserSource> userSources = <UserSource>[
      UserFirebaseApi(),
      UserMeteorApi()
    ];

    return userSources[0].userAuthenticateByEmail(email, password, mode);
  }
}