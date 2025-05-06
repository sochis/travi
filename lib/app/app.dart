import 'package:flutter/material.dart';
import 'package:flutter_base/app/router/app_router.dart';
import 'package:flutter_base/shared/themes/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base/shared/i18n/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Base',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: <Locale>[const Locale('en'), const Locale('ja')],
      routerConfig: router,
    );
  }
}
