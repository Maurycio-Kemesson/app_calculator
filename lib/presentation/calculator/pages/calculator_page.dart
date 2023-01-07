import 'package:app_calculator/presentation/calculator/models/memory.dart';
import 'package:app_calculator/presentation/calculator/widgets/display.dart';
import 'package:app_calculator/presentation/calculator/widgets/keyboard.dart';
import 'package:app_calculator/shared/preference_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage>
    with WidgetsBindingObserver {
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

  final Memory memory = Memory();
  bool darkMode = false;

  _onPressed(String command) {
    setState(() {
      memory.applyCommand(command);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ValueListenableBuilder(
      valueListenable: PreferenceTheme.theme,
      builder: (BuildContext context, Brightness theme, _) => MaterialApp(
        darkTheme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Color(0xff22202f),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xff2a2b36),
              ),
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        theme: ThemeData(
          brightness: theme,
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Color(0xfff2f7fa),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color(0xffe7e9ef),
              ),
              elevation: MaterialStateProperty.all<double>(0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              width: 110,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xffeceff4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  foregroundColor: Colors.grey[200],
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.light_mode,
                        color: darkMode == false ? Colors.black : Colors.grey),
                    Icon(
                      Icons.dark_mode_outlined,
                      color: darkMode == true ? Colors.black : Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Display(
                text: memory.value,
                theme: theme,
              ),
              KeyBoard(
                onPressed: _onPressed,
                theme: theme,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
