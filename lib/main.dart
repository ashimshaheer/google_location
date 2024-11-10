import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'App/modules/home/view_model/controller.dart';
import 'App/modules/map/view_model/map_provider.dart';
import 'App/modules/onboard/view/splash_screen.dart';
import 'App/utils/extentions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => HomeController())),
          ChangeNotifierProvider(create: ((context) => MapProvider())),
        ],
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return OrientationBuilder(
                builder: (context, orientation) {
                  Responsive().init(constraints, orientation);
                  return const MaterialApp(
                    title: 'Flutter Demo',
                    debugShowCheckedModeBanner: false,
                    home: SplashScreen(),
                  );
                },
              );
            },
          );
        });
  }
}
