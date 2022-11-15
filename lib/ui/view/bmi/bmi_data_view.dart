// ignore_for_file: avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../application/component/bmi_card_component.dart';
import '../../../application/component/button.dart';
import '../../../application/contants/constants.dart';
import '../../../application/helpers/bmi_calculator_helpers.dart';
import 'bmi_result_view.dart';

class BMIDataView extends StatefulWidget {
  const BMIDataView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMIDataViewState createState() => _BMIDataViewState();
}

class _BMIDataViewState extends State<BMIDataView> {
  double height = 150;
  int weight = 60;
  int age = 25;
  String gender = "";
  int state = 1;
  bool valid = false;

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text("$i",
            style: const TextStyle(
                color: Constants.black, fontFamily: Constants.primaryFontBold)),
      );
    }
    return weights;
  }

  Future<void> load() {
    return Future.delayed(const Duration(milliseconds: 500), () {
      // AppDialog.openUrl(response.data['url']);
    });
  }

  void validate() {
    bool _valid = gender != "";

    setState(() {
      valid = _valid;
    });
  }

  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => BmiViee())));
  }

  @override
  Widget build(BuildContext context) {
    Widget buildWeightAndAge() {
      return Container(
        margin: const EdgeInsets.all(Constants.spacing6),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: Constants.spacing2),
                padding: const EdgeInsets.all(Constants.spacing6),
                decoration: BoxDecoration(
                    color: Constants.white,
                    border: Border.all(color: Constants.gray.shade200),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Constants.spacing2))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("WEIGHT",
                        style: TextStyle(color: Constants.gray)),
                    BmiCardComponent(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: CupertinoPicker(
                                itemExtent: 25,
                                squeeze: 0.9,
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  weight = val + 20;
                                },
                                children: generateList(20, 220)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.white,
                    border: Border.all(color: Constants.gray.shade200),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(Constants.spacing2))),
                padding: const EdgeInsets.all(Constants.spacing6),
                child: Column(
                  children: [
                    const Text("AGE", style: TextStyle(color: Constants.gray)),
                    BmiCardComponent(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: CupertinoPicker(
                                itemExtent: 25,
                                squeeze: 0.9,
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  age = val + 15;
                                },
                                children: generateList(15, 90)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget buildGender(String images, String text, bool checked) {
      return InkWell(
        onTap: () async {
          setState(() {
            gender = text;
          });
          validate();
        },
        child: Container(
          decoration: BoxDecoration(
              color: Constants.white,
              border: Border.all(color: Constants.gray.shade200),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Constants.spacing2))),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                padding: const EdgeInsets.all(Constants.spacing6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Image.asset(
                        'assets/images/$images.png',
                        scale: 7.5,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: Constants.spacing2),
                      child: Text(
                        text,
                        style: const TextStyle(
                          fontSize: Constants.fontSizeLg,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Icon(
                  size: 30,
                  Icons.check_box,
                  color: checked == true
                      ? Constants.primaryColor
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget buildHeight() {
      return Container(
          decoration: BoxDecoration(
              color: Constants.white,
              border: Border.all(color: Constants.gray.shade200),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Constants.spacing2))),
          margin: const EdgeInsets.symmetric(horizontal: Constants.spacing6),
          padding: const EdgeInsets.all(Constants.spacing6),
          child: Column(
            children: [
              Container(
                child: const Text(
                  "HEIGHT",
                  style: TextStyle(
                      color: Constants.gray, fontSize: Constants.fontSizeLg),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: Constants.spacing2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "${height.round()}",
                      style: const TextStyle(
                          fontFamily: Constants.primaryFontBold,
                          fontSize: Constants.fontSize4Xl),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: Constants.spacing1),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            "Cm",
                            style: TextStyle(color: Constants.gray),
                          ),
                          const SizedBox(
                            height: Constants.spacing2,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: SliderTheme(
                  data: SliderThemeData(
                    thumbColor: Colors.white,
                    inactiveTrackColor: Constants.gray.shade300,
                    activeTrackColor: Constants.primaryColor,
                    overlayColor: Colors.transparent,
                    thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0, elevation: 3),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    thumbColor: Constants.white,
                    value: height,
                    max: 220,
                    min: 70,
                    divisions: 220,
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                    onChangeEnd: (double value) {},
                  ),
                ),
              ),
            ],
          ));
    }

    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Constants.spacing6),
        child: Button2(
          text: "CALCULATE YOUR BMI",
          state: !valid ? ButtonState.disabled : ButtonState.normal,
          onPressed: !valid
              ? () {
                  var snackBar =
                      const SnackBar(content: Text('Silahkan isi gender anda'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              : () {
                  final bmiCalculator = BMICalculatorHelpers(
                      height: height.round(), weight: weight);
                  bmiCalculator.calculateBMI();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return BMIResultView(
                      bmi: bmiCalculator.bmi ?? 0,
                    );
                  })));
                },
        ),
      )),
      // GestureDetector(
      //   onTap: () {
      //     final bmiCalculator =
      //         BMICalculatorHelpers(height: height.round(), weight: weight);
      //     bmiCalculator.calculateBMI();
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: ((context) {
      //           return BMIResultView(
      //             bmi: bmiCalculator.bmi ?? 0,
      //           );
      //         }),
      //       ),
      //     );
      //   },
      // ),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(color: Constants.black),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              size: 25,
              color: Constants.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(Constants.spacing6,
                  Constants.spacing6, Constants.spacing6, Constants.spacing6),
              child: Row(
                children: [
                  Expanded(
                      child: buildGender(
                          'banana', 'Male', gender == "Male" ? true : false)),
                  const SizedBox(
                    width: Constants.spacing2,
                  ),
                  Expanded(
                      child: buildGender('apple', 'Female',
                          gender == "Female" ? true : false)),
                ],
              ),
            ),
            buildHeight(),
            buildWeightAndAge(),
          ],
        ),
      ),
    );
  }
}
