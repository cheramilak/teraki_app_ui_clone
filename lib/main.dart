import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teraki_app_ui/providers/theme_provider.dart';
import 'package:teraki_app_ui/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Teraki app',
          theme: themeProvider.isDark ? ThemeData.dark() : ThemeData.light(),
          home: HomeScreen(),
        );
      }),
    );
  }
}
