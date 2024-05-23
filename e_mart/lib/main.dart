
import 'dart:io';
import 'package:e_mart/consts/consts.dart';
import 'package:e_mart/views/splash_screen/splash_screen.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
const kWebRecaptchaSiteKey = 'wpaSGpThM9R7Cponsvj9Z1QHzom2';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid?
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCwWi0JHCEIaYNtlHfOoxoBrXb8uCfZlpk",
      appId: "1:699210472074:android:ae51734d4b7e5556b92b73",
      messagingSenderId: "699210472074",
      projectId: "e-mart-f51e9",
    ),
  )
  :await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Mart',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          //For Appbar Icon Color
          iconTheme: IconThemeData(
            color: darkFontGrey
          )
        ),
        fontFamily: regular
      ),
      home: const SplashScreen(),
    );
  }
}
