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

 static const TextStyle titleDrawerItem = TextStyle(
   fontSize: 20,
   fontWeight: FontWeight.w600,
   color: Colors.white,
 );

 static const percentCardStyle = TextStyle(
   fontSize: 14,
   color:AppColors.greenAppColor,
   fontWeight: FontWeight.w600,
 );

 static const empDataTitle = TextStyle(
   color: AppColors.primaryColor,
   fontSize: 18,
   fontWeight: FontWeight.w500,
 );

 static const prefixTextStyle = TextStyle(
   color: Colors.black,
   fontSize: 16,
   fontWeight: FontWeight.w500,
 );

}