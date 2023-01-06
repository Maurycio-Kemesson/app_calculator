import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PreferenceTheme {
  static ValueNotifier<Brightness> theme = ValueNotifier(Brightness.light);

  static setTheme() {
    theme.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    changeStatusNavigationBar();
  }

  static changeStatusNavigationBar() {
    bool isDark = theme.value == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.dark : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarColor:
          isDark ? const Color(0xFF272A33) : const Color(0xFFF4F7F9),
      systemNavigationBarIconBrightness:
          isDark ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          isDark ? const Color(0xFF272A33) : const Color(0xFFF4F7F9),
    ));
  }
}
