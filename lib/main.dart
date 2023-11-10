import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_pr2_sakshi_2453/utils/route_utils.dart';
import 'package:re_pr2_sakshi_2453/views/screens/cartPage.dart';
import 'package:re_pr2_sakshi_2453/views/screens/favouritePage.dart';
import 'package:re_pr2_sakshi_2453/views/screens/homePage.dart';
import 'package:re_pr2_sakshi_2453/views/screens/productDetailedPage.dart';
import 'package:re_pr2_sakshi_2453/views/screens/splashScreen.dart';

import 'controller/products_controller.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ShopIn",
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.homepage: (context) => const HomePage(),
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.productDetailedPage: (context) => const ProductDetailedPage(),
        MyRoutes.favouritePage: (context) => const FavouritePage(),
        MyRoutes.cartPage: (context) => const CartPage(),
      },
    );
  }
}
