import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume/view/home_page.dart';

import 'style/dark_theme.dart';
import 'provider/dark_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return themeChangeProvider;
        }),
      ],
      child:
          Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          themeMode: themeProvider.themeMode,
          darkTheme: Themes.dark,
          home: const HomePage(),
        );
      }),
    );
  }
}
