import 'package:app_calculator/presentation/calculator/widgets/button.dart';
import 'package:app_calculator/presentation/calculator/widgets/button_row.dart';
import 'package:app_calculator/shared/colors.dart';
import 'package:flutter/material.dart';

class KeyBoard extends StatelessWidget {
  const KeyBoard({super.key, required this.onPressed, required this.theme});

  final void Function(String) onPressed;
  final Brightness theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme == Brightness.light
            ? const Color(0xfff2f7fa)
            : const Color(0xff22202f),
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffecf1f4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding:
            const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 15),
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [
            ButtonRow(
              buttons: [
                Button(
                  text: 'AC',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
                Button(
                  text: '+/-',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
                Button(
                  text: '%',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
                Button(
                  text: '/',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonRow(
              buttons: [
                Button(
                  text: '7',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '8',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '9',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: 'X',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonRow(
              buttons: [
                Button(
                  text: '4',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '5',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '6',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '-',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonRow(
              buttons: [
                Button(
                  text: '1',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '2',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '3',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '+',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonRow(
              buttons: [
                Button(
                  text: '.',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '0',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '000',
                  onPressed: onPressed,
                  colorFont: textTheme(theme),
                ),
                Button(
                  text: '=',
                  onPressed: onPressed,
                  colorFont: themeColorOperator(theme),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color themeColorOperator(Brightness theme) {
    if (theme == Brightness.light) {
      return colorFour;
    } else {
      return colorTwo;
    }
  }

  Color textTheme(Brightness theme) {
    if (theme == Brightness.light) {
      return colorOne;
    } else {
      return colorThree;
    }
  }
}
