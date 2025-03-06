import 'package:flutter/material.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/reset_password/code_verification.dart';
import 'package:graduation_project/modules/reset_password/custom_new_password.dart';
import 'package:graduation_project/modules/reset_password/forgot_password.dart';
import 'package:graduation_project/modules/reset_password/password_updated_screen.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:{
        LoginScreen.routeName : (_)=> LoginScreen(),
        ForgotPassword.routeName :(_)=> ForgotPassword(),
        CodeVerification.routeName:(_)=>CodeVerification(),
        CustomNewPassword.routeName:(_)=>CustomNewPassword(),
        UpdatePasswordScreen.routeName:(_)=>UpdatePasswordScreen(),
      },
      initialRoute: LoginScreen.routeName,
    );
  }
}