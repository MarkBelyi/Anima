
import 'package:anima/Screens/Sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales, // Поддерживаемые локали
        localizationsDelegates: const [
          S.delegate,  // Доступ к вашим строкам локализации
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const SignInPage()
    );
  }
}
