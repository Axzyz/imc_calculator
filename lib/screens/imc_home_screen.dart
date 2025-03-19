import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';
import 'package:imc_calculator/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  double selectedHeight = 170;
  int selectedWeight = 80;
  int selectedAge = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          height: selectedHeight,
          onChanged: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              NumberSelector(
                title: 'Peso',
                value: selectedWeight,
                onDecrement: () {
                  setState(() {
                    if (selectedWeight > 20) {
                      selectedWeight--;
                    }
                  });
                },
                onIncrement: () {
                  setState(() {
                    if (selectedWeight < 300) {
                      selectedWeight++;
                    }
                  });
                },
              ),
              SizedBox(width: 16.0),
              NumberSelector(
                title: 'Edad',
                value: selectedAge,
                onDecrement: () {
                  setState(() {
                    if (selectedAge > 5) {
                      selectedAge--;
                    }
                  });
                },
                onIncrement: () {
                  setState(() {
                    if (selectedAge < 100) {
                      selectedAge++;
                    }
                  });
                },
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 16.0,
            right: 16.0,
            bottom: 32.0,
          ),
          child: SizedBox(
            height: 60.0,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => ImcResultScreen(
                          height: selectedHeight,
                          weight: selectedWeight,
                        ),
                  ),
                );
              },
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
              ),
              child: Text('Calcular', style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
