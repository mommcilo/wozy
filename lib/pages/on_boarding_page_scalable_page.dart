import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wozy/l10n/app_localizations.dart';

import 'onboarding_page.dart';

void main() {
  runApp(const OnboardingPageScalablePage());
}

class OnboardingPageScalablePage extends StatelessWidget {
  const OnboardingPageScalablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return isIOS
            ? CupertinoApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('sr'),
          home: const OnboardingPage(),
        )
            : MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('sr'),
          home: const OnboardingPage(),
        );
      },
    );
  }
}