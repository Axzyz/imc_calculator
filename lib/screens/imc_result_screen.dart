import 'package:flutter/material.dart';
import 'package:imc_calculator/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final double height;
  final int weight;
  const ImcResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200),
        Text('$height', style: TextStyles.bodyText),
        Text('$weight', style: TextStyles.bodyText),
      ],
    );
  }
}
