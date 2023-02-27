import 'package:first_app/common/route_wrapper.dart';
import 'package:first_app/material-theme/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: FRouteWrapper.route(),
      // title: 'My Secret Diary',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
    );
  }
}

// return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     useMaterial3: true,
    //     colorScheme: lightColorScheme,
    //   ),
    //   darkTheme: ThemeData(
    //     useMaterial3: true,
    //     colorScheme: darkColorScheme,
    //   ),
    //   themeMode: ThemeMode.system,
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
