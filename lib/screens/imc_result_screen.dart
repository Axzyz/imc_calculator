import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
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
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appbarResult(),
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double fixedHeight = height / 100;
    double imcResult = weight / (fixedHeight * fixedHeight);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('El resultado de tu IMC', style: TextStyles.componentText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      getStateByImc(imcResult).toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: getColorByImc(imcResult)
                      ),
                    ),
                    Spacer(),
                    Text(
                      imcResult.toStringAsFixed(2),
                      style: TextStyles.bigText,
                    ),
                    Spacer(),
                    Text(
                      getDescriptionByImc(imcResult),
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 60.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyles.btnStyle,
                child: Text('Finalizar', style: TextStyles.bodyText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appbarResult() {
    return AppBar(
      title: Text('Resultado IMC'),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
  
  Color getColorByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => Colors.blue, // IMC bajo
      < 24.9 => Colors.green, // IMC normal
      < 29.99 => Colors.orange, // Sobrepeso
      _ => Colors.red // Obesidad
    };
  }
  
  String getStateByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => 'Bajo', // IMC bajo
      < 24.9 => 'Normal', // IMC normal
      < 29.99 => 'Sobrepeso', // Sobrepeso
      _ => 'Obesidad' // Obesidad
    };
  }
  
  String getDescriptionByImc(double imcResult) {
    return switch (imcResult) {
      < 18.5 => 'Tu peso está por debajo de lo recomendado.', // IMC bajo
      < 24.9 => 'Tu peso está en el rango saludable.', // IMC normal
      < 29.99 => 'Tienes sobrepeso, cuida tu alimentación.', // Sobrepeso
      _ => 'Tienes obesidad, consulta con un especialista.' // Obesidad
    };
  }
}
