import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wozy/theme/app_sizes.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class AddNewVehiclePage extends StatelessWidget {
  const AddNewVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {

    final Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          VehicleButton(imagePath: 'assets/images/ranamotorworks-M28SAp2I9_k-unsplash.jpg', label: "Automobil"),
          SizedBox(height: AppSizes.sizedBoxSmall),
          VehicleButton(imagePath: 'assets/images/gelmis-bartulis-IYzIIJrH-GM-unsplash.jpg', label: "Motocikl"),
          SizedBox(height: AppSizes.sizedBoxSmall),
          VehicleButton(imagePath: 'assets/images/luca-david-ia8uTRsZZYY-unsplash.jpg', label: "Bicikl"),
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Dodavanje novog vozila'),
        leading: null,
      ),
      child: SafeArea(child: content),
      backgroundColor: AppColors.backgroundColor,
    )
        : Scaffold(
      appBar: AppBar(
        title: const Text('Dodavanje novog vozila'),
        backgroundColor: AppColors.backgroundColor, // ista boja kao pozadina
        elevation: 0, // uklanja senku ispod AppBar-a
        leading: null,
      ),
      body: SafeArea(child: content),
      backgroundColor: AppColors.backgroundColor,
    );

  }

}

class VehicleButton extends StatelessWidget {
  final String imagePath;
  final String label;

  const VehicleButton({
    super.key,
    required this.imagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    double buttonSize = calculateResponsiveButtonSize(context); // broj posle decimale oznacava broj procenata sirine ekrana koji se uzima

    return GestureDetector(
      onTap: () {
        // ovde možeš dodati logiku za navigaciju kada budeš hteo
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(75),
                  blurRadius: 2,
                  offset: Offset(4, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.sp),
          Text(
            label,
            style: TextStyle(
              fontFamily: AppTextStyles.FontFamily,
              fontWeight: FontWeight.w500,
              fontSize: AppSizes.fontSize,
              color: AppColors.whiteGray,
            ),
          ),
        ],
      ),
    );
  }

  double calculateResponsiveButtonSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (Platform.isAndroid && screenWidth <= 360) {
      return screenWidth * 0.30;
    } else {
      return screenWidth * 0.40;
    }
  }
}
