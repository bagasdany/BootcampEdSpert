import '../contants/string_constants.dart';

class BMICalculatorHelpers {
  int? weight = 0;
  int? height = 0;
  double? bmi = 0;
  String? bmiCategory = "";
  String? bmiDescription = "";

  BMICalculatorHelpers({this.weight, this.height});
  BMICalculatorHelpers.fromBmiValue(this.bmi);

  double calculateBMI() {
    double heightInMeter = (height ?? 0) / 100;
    final h = heightInMeter * heightInMeter;
    bmi = (weight ?? 0) / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = "";
    if (bmi! < 16.0) {
      category = StringConstants.underweightSevere;
    } else if (bmi! < 17 && bmi! >= 16.0) {
      category = StringConstants.underweightModerate;
    } else if (bmi! < 18.5 && bmi! >= 17) {
      category = StringConstants.underweightMild;
    } else if (bmi! < 25 && bmi! >= 18.5) {
      category = StringConstants.normal;
    } else if (bmi! < 30 && bmi! >= 25) {
      category = StringConstants.overweight;
    } else if (bmi! < 35 && bmi! >= 30) {
      category = StringConstants.obeseI;
    } else if (bmi! < 40 && bmi! >= 35) {
      category = StringConstants.obeseII;
    } else if (bmi! >= 40 && bmi! >= 40) {
      category = StringConstants.obeseIII;
    }

    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealthRiskDescription() {
    String desc = "";
    switch (bmiCategory!) {
      case StringConstants.underweightSevere:
      case StringConstants.underweightModerate:
      case StringConstants.underweightMild:
        desc = "Possible nutritional deficiency and osteoporosis.";
        break;
      case StringConstants.normal:
        desc = "Low risk (healthy weight).";
        break;
      case StringConstants.overweight:
        desc =
            "Moderate risk of developing heart disease, high blood pressure, stroke, diabetes.";
        break;
      case StringConstants.obeseI:
      case StringConstants.obeseII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes.";
        break;
      case StringConstants.obeseIII:
        desc =
            "Very high risk of developing heart disease, high blood pressure, stroke, diabetes.";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
