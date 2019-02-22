import 'dart:convert';
import 'dart:async';
import '../../models/auth.dart';
import 'package:http/http.dart' as http;
import 'user_source.dart';

class UserFirebaseApi implements UserSource {
  Future<Map<String, dynamic>> userAuthenticateByEmail(
      String email, String password, AuthMode mode) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    http.Response response;
    if (mode == AuthMode.Login) {
      response = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyDVhJk1uFEU_bOJwcqsi3HDDPDkdZThcpQ',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      response = await http.post(
        'https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyDVhJk1uFEU_bOJwcqsi3HDDPDkdZThcpQ',
        body: json.encode(authData),
        headers: {'Content-Type': 'application/json'},
      );
    }
    final Map<String, dynamic> responseData = json.decode(response.body);
    bool success = false;
    String message = 'Something went wrong.';
    String userId = '';
    String token = '';
    int expiresIn = 0;
    print(responseData);
    if (responseData.containsKey('idToken')) {
      success = true;
      message = 'Authentication succeeded!';
      userId = responseData['localId'];
      token = responseData['idToken'];
      expiresIn = int.parse(responseData['expiresIn']);
    } else if (responseData['error']['message'] == 'EMAIL_EXISTS') {
      message = 'This email already exists.';
    } else if (responseData['error']['message'] == 'EMAIL_NOT_FOUND') {
      message = 'This email was not found.';
    } else if (responseData['error']['message'] == 'INVALID_PASSWORD') {
      message = 'The password is invalid.';
    }


    return {
      'success': success,
      'message': message,
      'userId': userId,
      'email': email,
      'token': token,
      'expiresIn': expiresIn
    };
  }

}
