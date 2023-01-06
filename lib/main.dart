import 'package:app_calculator/presentation/calculator/pages/calculador_page.dart';
import 'package:app_calculator/shared/preference_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    PreferenceTheme.setTheme();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    PreferenceTheme.setTheme();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: PreferenceTheme.theme,
      builder: (BuildContext context, Brightness theme, _) => MaterialApp(
        title: 'Calculadora',
        theme: ThemeData(
          brightness: theme,
        ),
        home: const CalculatorPage(),
      ),
    );
  }
}
