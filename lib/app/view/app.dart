import 'package:flutter/material.dart';
import 'package:moon_design/moon_design.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dump Playground',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          MoonTheme(tokens: MoonTokens.light),
        ],
      ),
      darkTheme: ThemeData.dark().copyWith(
        extensions: <ThemeExtension<dynamic>>[
          MoonTheme(tokens: MoonTokens.dark),
        ],
      ),
      home: const Scaffold(
        body: Center(
          child: Text('Welcome to Dump Playground!'),
        ),
      ),
    );
  }
}
