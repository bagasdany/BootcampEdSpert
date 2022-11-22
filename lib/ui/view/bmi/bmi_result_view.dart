import 'package:flutter/material.dart';

import '../../../application/component/button.dart';
import '../../../application/contants/constants.dart';
import '../../../application/helpers/bmi_calculator_helpers.dart';

class BMIResultView extends StatelessWidget {
  const BMIResultView({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  final double bmi;

  @override
  Widget build(BuildContext context) {
    BMICalculatorHelpers bmiCalculator = BMICalculatorHelpers.fromBmiValue(bmi);
    bmiCalculator.determineBmiCategory();
    bmiCalculator.getHealthRiskDescription();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculation Results',
          style: TextStyle(color: Constants.black),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Constants.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Constants.spacing6),
        child: Button2(
          text: "ReCalculate",
          state: ButtonState.normal,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(
                        Constants.spacing6,
                        Constants.spacing6,
                        Constants.spacing6,
                        Constants.spacing2),
                    child: const Text(
                      'Your Result',
                      style: TextStyle(
                          fontSize: Constants.fontSize2Xl,
                          fontWeight: FontWeight.bold,
                          color: Constants.gray),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: Constants.spacing6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Constants.spacing4),
              ),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: Constants.spacing6),
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.spacing6),
                    child: Text(
                      bmiCalculator.bmiCategory ?? "",
                      style: const TextStyle(
                        fontSize: Constants.fontSize2Xl,
                        fontFamily: Constants.primaryFontBold,
                        color: Constants.orange,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: Constants.spacing6),
                    child: Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: Constants.fontSize11Xl,
                        fontFamily: Constants.primaryFontBold,
                        color: Constants.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: Constants.spacing1),
                    child: const Text(
                      "Normal BMI range :",
                      style: TextStyle(
                        fontSize: Constants.fontSizeLg,
                        fontFamily: Constants.primaryFontBold,
                        color: Constants.gray,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: Constants.spacing6),
                    child: const Text(
                      "18,5 - 25 Kg/m2",
                      style: TextStyle(
                        fontSize: Constants.fontSizeLg,
                        fontFamily: Constants.primaryFontBold,
                        color: Constants.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.spacing6),
                    margin: const EdgeInsets.only(bottom: Constants.spacing8),
                    child: Text(
                      bmiCalculator.bmiDescription ?? "",
                      style: const TextStyle(
                        fontSize: Constants.fontSizeLg,
                        fontFamily: Constants.primaryFontBold,
                        color: Constants.black,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
