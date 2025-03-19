import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double height;
  final Function(double) onChanged;
  const HeightSelector({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Text('Altura'.toUpperCase(), style: TextStyles.bodyText),
            Text(
              '${widget.height.toStringAsFixed(0)} cm',
              style: TextStyles.componentText,
            ),
            Slider(
              value: widget.height,
              onChanged: (newHeight) {
                widget.onChanged(newHeight);
              },
              min: 150,
              max: 220,
              divisions: 70,
              // label: "$height cm",
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
