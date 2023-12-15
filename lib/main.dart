import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_app/config/themes/themes.dart';
import 'package:shopping_app/core/utils/observer.dart';

import 'features/signup/presentation/pages/signup_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: MyThemeData.LightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        title: 'Shopping App',
        home: SignUpScreen(),
      ),
    );
  }
}


