import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wozy/l10n/app_localizations.dart';
import 'package:wozy/pages/on_boarding_page_scalable_page.dart';
import 'dart:io' show Platform;

import 'services/local_storage_service.dart';
import 'pages/home_page.dart';
import 'pages/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final hasUserData = await LocalStorageService.hasUserData();
  runApp(WozyApp(hasUserData: hasUserData));
}

class WozyApp extends StatelessWidget {
  final bool hasUserData;

  const WozyApp({super.key, required this.hasUserData});

  @override
  Widget build(BuildContext context) {

    const localizationsDelegates = [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

    const supportedLocales = [
      Locale('sr'), // Serbian
      Locale('en') // English
    ];

    return Platform.isIOS
        ? CupertinoApp(
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
            home: hasUserData ? HomePage() : OnboardingPageScalablePage(),
          )
        : MaterialApp(
            localizationsDelegates: localizationsDelegates,
            supportedLocales: supportedLocales,
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
            theme: ThemeData(useMaterial3: true),
            home: hasUserData ? HomePage() : OnboardingPageScalablePage(),
          );
  }
}