import 'package:app_calculator/shared/colors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({
    super.key,
    required this.text,
    required this.theme,
  });
  final String text;
  final Brightness theme;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: theme == Brightness.light
            ? const Color(0xfff2f7fa)
            : const Color(0xff22202f),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: AutoSizeText(
                text,
                maxFontSize: 80,
                minFontSize: 20,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.none,
                  color: colorOne,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
