import 'dart:math';
import 'dart:ui';

//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Routes {
  String get root => "/root";
  String get home => "/home";
  String get map => "/map";
  String get signIn => "/signIn";
  String get signUp => "/signUp";}

class ScreenHelper {
  String get signin => "Signin";
  String get teacherProfile => "Teacher Profile";
  String get studentProfile => "Student Profile";
  String get subjectList => "Subject";
  String get subjectDetail => "Subject Detail";
  String get postList => "Post";
  String get postDetail => "Post Detail";}

class Fonts {
  String get regular => "";
  String get bold => "";
  String get italic => "";
  String get quickFont => "Quicksand";
  String get abelFont => "Abel";
  String get dinNextFont => "DinNext";
  String get khBoeungFont => "KhBoeung";
  String get quickNormalFont => "Quicksand_Book.otf";
  String get quickLightFont => "Quicksand_Light.otf";
  String get kantumruy => "Kantumruy";
}

class Images {
  String get imageDir => "assets/images";
  String get appIcon => "$imageDir/logo.png";
  String get imagePlaceholder => "$imageDir/image_placeholder.png";
  String get noImagePlaceholder => "$imageDir/no_image_placeholder.png";
  String get notFound => "$imageDir/not_found.png";
}

class CommonColors {
   get primary => Color(0xFF4E54C8);
   get secondary => Color(0xFF8F94FB);
   get accent => Color(0xFF000000);
   get black => Color(0xFF000000);
   get success => Color(0xFF000000);
   get warning => Color(0xFF000000);
   get danger => Color(0xFFfb4740);
   get info => Color(0xFF4dd1f4);
   List<Color> get kitGradients => [Color(0xFF4E54C8), Color(0xFF8F94FB)];
   List<Color> get kitGradients2 => [    Color(0xffb7ac50), Colors.orange.shade900];
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
  static Images images = Images();
  static CommonColors colors = CommonColors();
  static MethodNames methodNames = MethodNames();

  static const String appName = "CamDebate";
  static const String version = "0.0.1";
  static const String FORBIDDEN = "403";
  static const String NOT_FOUND = "404";
  static const String OK = "200";
  static const String CREATED = "201";
  static const String NOT_MODIFIED = "304";
  static const String coming_soon = "Coming Soon";

/*static storageRef(FirebaseStorage storage, String path, String filename) {
    return storage.ref().child(path).child(filename);
  }*/
}
