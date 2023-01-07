import 'package:app_calculator/presentation/calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.buttons});
  final List<Button> buttons;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, item) {
          list.isEmpty
              ? list.add(item)
              : list.addAll([
                  const SizedBox(
                    width: 20,
                  ),
                  item
                ]);
          return list;
        }),
      ),
    );
  }
}
