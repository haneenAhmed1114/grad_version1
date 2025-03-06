import 'package:flutter/material.dart';
import 'package:graduation_project/modules/reset_password/forgot_password.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Login here',
                      style: AppStyles.pageTitle,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Welcome back you\’ve\n       been missed!',
                      style: AppStyles.subTitleStyle,
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: (value) {
                        if (isValidEmail(value ?? '')) {
                          return null;
                        } else {
                          return 'Enter valid email!';
                        }
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty || value == null) {
                          return 'Enter valid password!';
                        } else if (value.length < 8) {
                          return 'password must not be less than 8 characters';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      suffixIcon: isPasswordShown
                          ? Icons.visibility_off
                          : Icons.remove_red_eye,
                      isPassword: isPasswordShown,
                      suffixPressed: () {
                        setState(() {
                          isPasswordShown = !isPasswordShown;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ForgotPassword.routeName);
                        },
                        child: Text(
                          'Forgot your password?',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    defaultButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      },
                      text: 'Sign in',
                    ),
                    SizedBox(
                      height: 55,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: customDivider(
                              firstColor: AppColors.dividerBlueColor,
                              secondColor: AppColors.dividerGreyColor,
                            firstPosition: 0.2,
                            secondPosition: 0.6,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "Or continue with",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: customDivider(
                              firstColor: AppColors.dividerGreyColor,
                              secondColor: AppColors.dividerBlueColor,
                            firstPosition: 0.4,
                            secondPosition: 0.8,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Image.asset(AppAssets.googleLogo),
                          iconSize: 10,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: Image.asset(AppAssets.facebookLogo),
                          iconSize: 10,
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: Image.asset(AppAssets.appleLogo),
                          iconSize: 10,
                          onPressed: () {},
                        ),
                      ],
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

  bool isValidEmail(String inputEmail) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(inputEmail);
  }
}
