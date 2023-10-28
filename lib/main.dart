import 'package:business_card_scanner/controller/database/crud_functions/crud_functions.dart';
import 'package:business_card_scanner/view/home/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  final DabaseCURDfunctionController dabaseCURDfunctionController =
      Get.put(DabaseCURDfunctionController());
  await dabaseCURDfunctionController.getAllBusinessCards();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Business Card Scanner',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 179, 255),
          ),
          useMaterial3: true,
        ),
        home: const ScreenHome());
  }
}
