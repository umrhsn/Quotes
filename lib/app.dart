import 'package:flutter/material.dart';
import 'package:quotes/src/config/routes/app_routes.dart';
import 'package:quotes/src/config/themes/app_theme.dart';
import 'package:quotes/src/core/utils/app_strings.dart';
import 'package:quotes/src/features/random_quote/presentation/screens/quote_screen.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      themeMode: ThemeMode.system,
      theme: AppThemes.light(),
      darkTheme: AppThemes.dark(),
      home: const QuoteScreen(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
