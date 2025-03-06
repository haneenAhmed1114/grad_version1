
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/app_colors.dart';

Widget defaultButton({
  double width=  double.infinity,
  Color backgroundColor =  AppColors.primaryColor,
  required void Function()? onPressed,
  required String text,
  Color textColor = Colors.white,
  bool isUpperCase = false,
  double radius=10.0,
  bool isBorder = false,
})
{
  return  Container(
    width: width,
    height: 55,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      border: isBorder ? Border.all(color: AppColors.primaryColor, width: 2) : null,
    ),
    child: MaterialButton(
      onPressed: onPressed,
      child: Text(
       isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(
          color : textColor,
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
      ),
    ),
  );
}


//*****************************************************


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onFieldSubmitted,
  void Function(String)? onChanged,
  required String? Function(String?)? validator,
  String? hintText,
  bool isPassword = false,
  IconData? prefixIcon,
  IconData? suffixIcon ,
  void Function()? suffixPressed,
})=>TextFormField(
  cursorColor: AppColors.primaryColor,
  keyboardType: type,
  controller: controller,
  obscureText: isPassword,
  decoration: InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: AppColors.greyAppColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
      // borderSide: BorderSide(
      //   color: AppColors.primaryColor,
      //   width: 2,
      // ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.errorBorderColor,
        width: 2,
      ),
    ),
    suffixIcon: suffixIcon != null ? IconButton(
      icon: Icon(
        suffixIcon,
        color: AppColors.eyeColor,
      ),
      onPressed:suffixPressed,
    ) : null ,
    prefixIcon: Icon(
      prefixIcon,
    ),
    fillColor: AppColors.filledColor,
    filled: true,
  ),
  onFieldSubmitted:onFieldSubmitted,
  onChanged: onChanged,
  validator: validator,
);


//*****************************************************

Widget OtpTextField(context)=>SizedBox(
  height: 50,
  width: 50,
  child: TextFormField(
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.filledColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.errorBorderColor,
          width: 2,
        ),
      ),
    ),
    inputFormatters: [
      LengthLimitingTextInputFormatter(1),
      FilteringTextInputFormatter.digitsOnly,
    ],
    onChanged: (value) {
      if(value.length==1)
        {
          FocusScope.of(context).nextFocus();
        }
    },
  ),
);


//*****************************************************

Widget customDivider({required Color firstColor,required Color secondColor,required double firstPosition,required double secondPosition})=>Container(
  height: 3, // Adjust thickness
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
       firstColor,
       secondColor,
      ],
      stops: [
       firstPosition,
        secondPosition,
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ),
  ),
);
