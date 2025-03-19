import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onDecrement;
  final Function() onIncrement;

  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.title.toUpperCase(), style: TextStyles.bodyText),
            Text('${widget.value}', style: TextStyles.componentText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 16.0,
              children: [
                FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    widget.onDecrement();
                  },
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    widget.onIncrement();
                  },
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
