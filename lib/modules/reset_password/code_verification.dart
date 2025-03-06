import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/modules/reset_password/custom_new_password.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import '../../shared/styles/app_styles.dart';

class CodeVerification extends StatelessWidget {
  const CodeVerification({super.key});

  static const String routeName ='CodeVerificationScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      'Code Verification',
                      style: AppStyles.subTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Enter OTP (One time password) sent to\n yyyy@gmail.com',
                      style: AppStyles.passInstructionStyle,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OtpTextField(context),
                      OtpTextField(context),
                      OtpTextField(context),
                      OtpTextField(context),
                      OtpTextField(context),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                        '2 :00 mins',
                      style: AppStyles.passInstructionStyle,
                    ),
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  defaultButton(onPressed: () {
                    Navigator.of(context).pushNamed(CustomNewPassword.routeName);
                  }, text: 'Verify code',
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  defaultButton(onPressed: () {

                  },
                    text: 'Resend Code',
                    textColor: AppColors.primaryColor,
                    backgroundColor: AppColors.filledColor,
                    isBorder: true,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
