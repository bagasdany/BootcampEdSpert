// ignore_for_file: avoid_unnecessary_containers, library_private_types_in_public_api

import 'package:edspert_bootcamp/ui/view/bmi/bmi_data_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/app/contants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     Duration(seconds: 3),
    //     () => Navigator.of(context).pushReplacement(MaterialPageRoute(
    //         builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: const Text("Bootcamp"),
          leading: InkWell(
              onTap: () {
                // Navigator.pop(context);
              },
              child: const Icon(
                Icons.format_list_bulleted,
                size: 25,
                color: Constants.black,
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Constants.white,
                      padding: const EdgeInsets.all(Constants.spacing4),
                      margin: const EdgeInsets.only(top: Constants.spacing4),
                      child: const Text(
                        "Hello,",
                        style: TextStyle(
                            fontFamily: Constants.primaryFontBold,
                            fontSize: Constants.fontSize2Xl),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const BMIDataView()));
                },
                child: Container(
                  margin: const EdgeInsets.only(top: Constants.spacing4),
                  padding: const EdgeInsets.all(Constants.spacing4),
                  color: Constants.sky.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                "Try your BMI Calculator",
                                style: TextStyle(
                                    fontFamily: Constants.primaryFontBold,
                                    fontSize: Constants.fontSizeLg),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Constants.spacing4, vertical: 0),
                          child: SvgPicture.asset(
                            'assets/svg/chevron_forward.svg',
                            width: 21,
                            height: 21,
                            alignment: Alignment.topCenter,
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
