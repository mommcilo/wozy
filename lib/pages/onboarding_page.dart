import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:wozy/l10n/app_localizations.dart';

import '../theme/app_colors.dart';
import '../theme/app_sizes.dart';
import '../theme/app_text_styles.dart';
import 'add_new_vehicle_page.dart';
import 'add_new_vehicle_scalable_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appName = AppLocalizations.of(context)!.appName;
    final onboardingText = AppLocalizations.of(context)!.onBoardingText.replaceAll(r'\n', '\n');
    final addVehicleText = AppLocalizations.of(context)!.addVehicle;

    final content = Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.spacingLarge),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appName,
              style:  TextStyle(
                fontFamily: AppTextStyles.FontFamily,
                fontSize: AppSizes.headingSize,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteGray,
              ),
            ),
             SizedBox(height: AppSizes.sizedBox),
            Text(
              onboardingText,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontFamily: AppTextStyles.FontFamily,
                fontSize: AppSizes.fontSize,
                height: AppSizes.fontHeight,
                color: AppColors.whiteGray,
              ),
            ),
            SizedBox(height: AppSizes.sizedBox),
            Platform.isIOS
                ? CupertinoButton.filled(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewVehiclePage()),
                );
              },
              child: Text(
                addVehicleText.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTextStyles.FontFamily,
                  fontWeight: FontWeight.bold,
                  letterSpacing: AppSizes.letterSpaces,
                  color: AppColors.backgroundColor
                ),
              ),
              color: AppColors.whiteGray,
            )
                : ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewVehicleScalablePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.whiteGray,
                foregroundColor: AppColors.backgroundColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                addVehicleText.toUpperCase(),
                style: TextStyle(
                  fontFamily: AppTextStyles.FontFamily,
                  fontWeight: FontWeight.bold,
                  letterSpacing: AppSizes.letterSpaces,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
      child: SafeArea(child: content),
      backgroundColor: AppColors.backgroundColor,
    )
        : Scaffold(
      body: SafeArea(child: content),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}