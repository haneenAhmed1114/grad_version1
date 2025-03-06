import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles
{
 static const TextStyle pageTitle = TextStyle(
   color: AppColors.primaryColor,
   fontWeight: FontWeight.bold,
   fontSize: 30,
 );

 static const TextStyle subTitleStyle = TextStyle(
   color: Colors.black,
   fontSize: 20,
   fontWeight: FontWeight.w700,
 );

 static const TextStyle passInstructionStyle = TextStyle(
   color: AppColors.greyAppColor,
   fontSize: 14,
   fontWeight: FontWeight.w500,
 );

}