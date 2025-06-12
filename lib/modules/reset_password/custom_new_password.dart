import 'package:flutter/material.dart';
import 'package:graduation_project/modules/reset_password/password_updated_screen.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';

class CustomNewPassword extends StatefulWidget {
   CustomNewPassword({super.key});

  static const String routeName='newPasswordScreen';

  @override
  State<CustomNewPassword> createState() => _CustomNewPasswordState();
}

class _CustomNewPasswordState extends State<CustomNewPassword> {
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isPasswordAppeared = true ;


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
                    height: 39,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'New Password',
                      style: AppStyles.subTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColors.greyAppColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'Password must be at least 8 characters long.',
                          style: AppStyles.passInstructionStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColors.greyAppColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'Password must contain at least one upper case one lower case letter.',
                          style: AppStyles.passInstructionStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 2,
                        backgroundColor: AppColors.greyAppColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          'Password must contain at least one number or special character.',
                          style: AppStyles.passInstructionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'New Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                    isPassword: isPasswordAppeared,
                    suffixIcon: Icon(
                      isPasswordAppeared ? Icons.visibility_off : Icons.remove_red_eye,
                      color: AppColors.eyeColor,
                    ),
                    suffixPressed: () {
                      setState(() {
                        isPasswordAppeared = !isPasswordAppeared ;
                      });
                    },
                      validator: (value) {

                      },

                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultFormField(
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    validator: (value) {

                    },
                    isPassword: isPasswordAppeared,
                    suffixIcon: Icon(
                      isPasswordAppeared ? Icons.visibility_off : Icons.remove_red_eye,
                      color: AppColors.eyeColor,
                    ),
                    suffixPressed: () {
                      setState(() {
                        isPasswordAppeared = !isPasswordAppeared ;
                      });
                    },
                  ),
                  SizedBox(
                    height: 39,
                  ),
                  defaultButton(onPressed: () {
                             Navigator.of(context).pushNamed(UpdatePasswordScreen.routeName);
                  },
                    text: 'Submit',
                  ),
                  SizedBox(
                    height:17,
                  ),
                  defaultButton(onPressed: () {

                  },
                    text: 'Cancel',
                    isBorder: true,
                    backgroundColor: AppColors.filledColor,
                    textColor: AppColors.primaryColor,
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
