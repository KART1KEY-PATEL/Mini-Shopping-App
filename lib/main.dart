import 'package:flutter/material.dart';
import 'package:mini_shopping_app/pages/home_page.dart';
import 'package:mini_shopping_app/utils/color.dart';

void main() async {
  // Open the Hive box for CompanyModel, but data will
  runApp(
    const MyApp(),
  );
  // const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(
          primary: AppColors.secondaryColor,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryButtonColor,
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.textFieldColor,
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0.5,
              color: AppColors.accentTextColor,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primaryColor,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            color:
                AppColors.secondaryTextColor, // Customize the text color here
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.accentTextColor,
          selectionColor: const Color(0xFF4362FF),
          selectionHandleColor: const Color(0xFF4362FF),
        ),
        fontFamily: 'PlusJakartaSans',
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/base': (context) => const HomePage(),
      },
    );
  }
}
