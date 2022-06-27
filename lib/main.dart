import 'package:flutter/material.dart';

import 'commons/widgets/widgets.dart' show CustomScrollBehavior;
import 'views/home/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: child!,
        );
      },
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.black),
      ),
      home: const HomePage(),
    );
  }
}
