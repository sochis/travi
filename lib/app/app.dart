import 'package:flutter/material.dart';
import 'package:flutter_base/features/auth/domain/user.dart';
import 'package:flutter_base/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_base/features/user/presentation/pages/user_profile_page.dart';
import 'package:flutter_base/shared/themes/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_base/shared/i18n/l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const SignInPage(),
      routes: <String, WidgetBuilder>{
        '/profile':
            (BuildContext context) => const UserProfilePage(
              user: User(id: '123', email: 'test@example.com'),
            ),
      },
    );
  }
}
