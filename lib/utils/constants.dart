import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class Routes {
  String get root => "/root";
  String get news => "/news";
  String get postDetail => "/postDetail";
  // String get home => "/home";
  // String get map => "/map";
  // String get signIn => "/signIn";
  String get signUp => "/signUp";
}

class Fonts {
  String get regular => "Kantumruy";
  String get bold => "KHmuollight";
  String get italic => "";
  String get regularEn => "DinNext";
  String get kantumruy => "Kantumruy";
  String get battambang => "KhOSBattambang";
}

class FontSizes {
  double get display4 =>  96.0;
  double get display3 =>  60.0;
  double get display2 =>  48.0;
  double get display1 =>  34.0;
  double get headline => 24.0;
  double get title =>  21.0;
  double get subhead => 17.0;
  double get body2 =>  17.0;
  double get body1 =>  15.0;
  double get caption =>  13.0;
  double get button => 15.0;
  double get subtitle =>  15.0;
  double get overline =>  11.0;
  // double get subtitle2 =>  17.0;
  // double get text =>  14.0;
}

class Images {
  String get imageDir => "assets/images";
  String get appIcon => "$imageDir/logo.png";
  String get avatar => "$imageDir/avatar.png";
  String get imagePlaceholder => "$imageDir/image_placeholder.png";
  String get noImagePlaceholder => "$imageDir/no_image_placeholder.png";
  String get notFound => "$imageDir/not_found.png";
  String get food => "$imageDir/food.jpg";
  String get facebook => "$imageDir/facebook.png";
  String get google => "$imageDir/google.png";
  String get ministryLogo => "$imageDir/mot.png";
  String get img001 => "$imageDir/img001.jpg";
  String get img002 => "$imageDir/img002.png";
  String get img003 => "$imageDir/img003.jpg";
}

class CommonColors {
   get primary => Color(0xFF196ed2);
   get secondary => Color(0xFF196ed2);
   get accent => Color(0xFF000000);
   get black => Color(0xFF000000);
   get success => Color(0xFF1fc459);
   get warning => Color(0xFFe57835);
   get danger => Color(0xFFa91b41);
   get info => Color(0xFF1896cf);
   get background => Color(0xFFeaeaea);
   List<Color> get gradients => [Color(0xFF196ed2), Color(0xFF2f8efb)];
   List<Color> get gradients2 => [Color(0xffb7ac50), Colors.orange.shade900];
   /// Returns a random color.
  static final Random _random = new Random();
  static Color next() {return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));  }
}

class MethodNames {
  // static const String serverUrl= "http://192.168.43.3:3000";
  String get serverUrl => "http://192.168.1.100:3000";
}

//
// 403: forbidden
// 404: not found
// 200: ok
// 201: created
// 304: not modified
class Constants {
  static Routes routes = Routes();
  static Fonts fonts = Fonts();
  static FontSizes fontSizes = FontSizes();
  static Images images = Images();
  static CommonColors colors = CommonColors();
  static MethodNames methodNames = MethodNames();

  static const String appName = "CamDebate";
  static const String version = "0.0.1";
  // static const String FORBIDDEN = "403";
  // static const String NOT_FOUND = "404";
  // static const String OK = "200";
  // static const String CREATED = "201";
  // static const String NOT_MODIFIED = "304";
  // static const String coming_soon = "Coming Soon";

/*static storageRef(FirebaseStorage storage, String path, String filename) {
    return storage.ref().child(path).child(filename);
  }*/
}
