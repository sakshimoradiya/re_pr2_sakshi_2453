import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/route_utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void MySplash() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.homepage);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    MySplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const Icon(Icons.shopping_cart_rounded, size: 100),
            const Spacer(),
            const Text(
              "Get your product!!",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 15,
            ),
            const Spacer(),
            Transform.scale(
              scale: 0.5,
              child: const CircularProgressIndicator(),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
