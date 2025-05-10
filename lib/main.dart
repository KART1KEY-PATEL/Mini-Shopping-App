import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mini_shopping_app/bloc/brand/brand_bloc.dart';
import 'package:mini_shopping_app/bloc/cart/cart_bloc.dart';
import 'package:mini_shopping_app/bloc/like/like_bloc.dart';
import 'package:mini_shopping_app/models/cart_item_model.dart';
import 'package:mini_shopping_app/models/product_model.dart';
import 'package:mini_shopping_app/pages/base.dart';
import 'package:mini_shopping_app/pages/cart_page.dart';
import 'package:mini_shopping_app/pages/home_page.dart';
import 'package:mini_shopping_app/utils/color.dart';

void main() async {
  // Open the Hive box for CompanyModel, but data will
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CartItemAdapter());

  // Open boxes
  await Hive.openBox<CartItem>('cart');
  await Hive.openBox<Product>('likes');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => BrandBloc()),
        BlocProvider(create: (context) => LikesBloc()),
      ],
      child: MyApp(),
    ),
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
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ).copyWith(primary: AppColors.secondaryColor),
        buttonTheme: const ButtonThemeData(
          buttonColor: AppColors.primaryButtonColor,
          textTheme: ButtonTextTheme.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.textFieldColor,
          hintStyle: TextStyle(
            color: AppColors.secondaryTextColor,
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              width: 0.5,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.secondaryTextColor),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColors.secondaryTextColor,
          selectionColor: const Color(0xFF4362FF),
          selectionHandleColor: const Color(0xFF4362FF),
        ),
        fontFamily: 'PlusJakartaSans',
        useMaterial3: true,
      ),
      home: Base(),
      routes: {
        '/base': (context) => const HomePage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
