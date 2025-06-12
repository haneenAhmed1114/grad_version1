import 'package:flutter/material.dart';
import 'package:graduation_project/modules/reset_password/code_verification.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import '../../shared/styles/app_styles.dart';

class ForgotPassword extends StatelessWidget {
   ForgotPassword({super.key});
  static const String routeName = 'forgotPassword';
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key:formKey,
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
                        'Forget password',
                        style: AppStyles.subTitleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Provide the email address linked with your \naccount to reset your password',
                        style: AppStyles.passInstructionStyle,
                      ),
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Email',
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
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter valid email!';
                          }
                          return null;
                        },
                        hintText: 'Email',
                    ),

                    SizedBox(
                      height: 56,
                    ),
                    defaultButton(onPressed: () {
                      if(formKey.currentState!.validate())
                        {
                          Navigator.of(context).pushNamed(CodeVerification.routeName);
                        }

                    }, text: 'Next',
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    defaultButton(onPressed: () {

                    }, text: 'Cancel',
                    backgroundColor: AppColors.filledColor,
                      textColor: AppColors.primaryColor,
                      isBorder: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
