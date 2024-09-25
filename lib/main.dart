import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:me/data/provider/loginProvider.dart';
import 'package:me/constants.dart';
import 'package:me/screen/home/book_detail/LikeModel.dart';
import 'package:provider/provider.dart';

import 'auth/controller/AuthController.dart';
import 'screen/splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginProvider()),
      ChangeNotifierProvider(create: (context) => LikeModel())
    ],

      child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(Authcontroller());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: mTextColor
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: mTextColor
            )
          )
        ),
        buttonTheme: ButtonThemeData(

        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: mTextColor),
            displayMedium: TextStyle(color: mTextColor),

        )
      ),
      home: SplashScreen()

    );
  }
}


