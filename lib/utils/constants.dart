import 'dart:math';
import 'dart:ui';

//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Routes {
  String get root => "/root";
  String get news => "/news";
  // String get home => "/home";
  // String get map => "/map";
  // String get signIn => "/signIn";
  String get signUp => "/signUp";
}

// class ScreenHelper {
  // String get signin => "Signin";
  // String get teacherProfile => "Teacher Profile";
  // String get studentProfile => "Student Profile";
  // String get subjectList => "Subject";
  // String get subjectDetail => "Subject Detail";
  // String get postList => "Post";
  // String get postDetail => "Post Detail";}

class Fonts {
  String get regular => "";
  String get bold => "";
  String get italic => "";
  // String get quickFont => "Quicksand";
  // String get abelFont => "Abel";
  // String get dinNextFont => "DinNext";
  // String get khBoeungFont => "KhBoeung";
  // String get quickNormalFont => "Quicksand_Book.otf";
  // String get quickLightFont => "Quicksand_Light.otf";
  // String get kantumruy => "Kantumruy";
}

class FontSizes {
  double get heading1 =>  24.0;
  double get heading2 =>  22.0;
  double get title =>  20.0;
  double get subtitle =>  16.0;
  double get text =>  15.0;
  double get caption =>  14.0;
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
