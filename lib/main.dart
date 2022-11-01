import 'package:basalt/locator.dart';
import 'package:basalt/resources/app_colors.dart';
import 'package:basalt/resources/app_fonts.dart';
import 'package:basalt/routes/routes.dart';
import 'package:flutter/material.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basalt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: AppFonts.INTER,
          colorScheme: ThemeData().colorScheme.copyWith(
              primary: AppColors.PRIMARY, secondary: AppColors.SECONDARY)),
      routes: Routes.ROUTES,
      initialRoute: Routes.HOME_ROUTE,
    );
  }
}
