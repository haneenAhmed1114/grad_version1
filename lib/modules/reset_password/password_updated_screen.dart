import 'package:flutter/material.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';

import '../../shared/styles/app_styles.dart';

class UpdatePasswordScreen extends StatelessWidget {
  const UpdatePasswordScreen({super.key});
  static const String routeName='updateScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: AppStyles.pageTitle,
                ),
                SizedBox(
                  height: 56,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Password Updated',
                    style: AppStyles.subTitleStyle,
                  ),
                ),
                Text(
                    'Your password has been successfully updated.',
                  style: AppStyles.passInstructionStyle,

                ),
                SizedBox(
                  height: 56,
                ),
                defaultButton(onPressed: () {
                 Navigator.of(context).pushNamed(LoginScreen.routeName);
                }, text: 'Sign in',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
