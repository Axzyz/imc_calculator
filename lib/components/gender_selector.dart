import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = 'hombre';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 8.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedGender == 'hombre'
                          ? AppColors.backgroundComponentSelected
                          : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset('assets/images/male.png', height: 100.0),
                      SizedBox(height: 8.0),
                      Text('Hombre'.toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: (){
              setState(() {
                selectedGender = 'mujer';
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 16.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      selectedGender == 'mujer'
                          ? AppColors.backgroundComponentSelected
                          : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Image.asset('assets/images/female.png', height: 100.0),
                      SizedBox(height: 8.0),
                      Text('Mujer'.toUpperCase(), style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
