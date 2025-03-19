import 'package:flutter/material.dart';
import 'package:imc_calculator/components/gender_selector.dart';
import 'package:imc_calculator/components/height_selector.dart';
import 'package:imc_calculator/components/number_selector.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 18;
  int selectedWeight = 80;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(),
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
      ],
    );
  }
}
