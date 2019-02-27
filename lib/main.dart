import 'package:flutter/material.dart';
import './utils/localization/initialize_i18n.dart' show initializeI18n;
import 'app.dart';


void main() async{
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  Map<String, Map<String, String>> localizedValues = await initializeI18n();
  runApp(MyApp(localizedValues));
}

