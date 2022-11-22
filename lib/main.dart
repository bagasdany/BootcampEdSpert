import 'package:edspert_bootcamp/ui/view/startup/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/contants/constants.dart';
import 'controller/book_controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookControllers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bootcamp edspert',
        theme: ThemeData(
          scaffoldBackgroundColor: Constants.gray.shade100,
          appBarTheme: const AppBarTheme(
              backgroundColor: Constants.white, centerTitle: false),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
