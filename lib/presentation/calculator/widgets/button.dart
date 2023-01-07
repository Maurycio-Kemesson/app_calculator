import 'package:app_calculator/shared/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorFont = colorFontDefault,
  });

  static const colorFontDefault = colorOne;

  Color teste({required Brightness teste}) {
    return colorFour;
  }

  final String text;
  final Color colorFont;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => onPressed(text),
        child: Text(
          text,
          style: TextStyle(
            color: colorFont,
            fontSize: 21,
            fontFamily: 'Inter',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
