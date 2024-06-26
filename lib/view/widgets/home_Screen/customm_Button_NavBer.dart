import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function()? onPressed;
  final IconData? icon;
  final bool? activeColor;
  const CustomBottomNavBar({super.key, required this.onPressed, required this.icon, required this.activeColor,});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: activeColor == true ? AppColors.primaryColor : AppColors.blackIntermediate,
            size: activeColor == true ? 40 : null ,
          ),
        ],
      ),
    );
  }
}
