import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:graduation_project/layout/home_layout.dart';
import 'package:graduation_project/modules/home_screen/home_screen.dart';
import 'package:graduation_project/modules/login/cubit/login_cubit.dart';
import 'package:graduation_project/modules/login/cubit/states.dart';
import 'package:graduation_project/modules/reset_password/forgot_password.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';
import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';


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
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppLoginCubit(),
      child: BlocConsumer<AppLoginCubit,AppLoginStates>(
          listener: (context, state) {
            if (state is AppLoginSuccessState) {
              showToast(
                message: 'Login success',
                color: Colors.green,
              );
              Navigator.pushNamed(context, HomeLayout.routeName);
            }

            if (state is AppLoginErrorState) {
              showToast(
                message: state.error,
                color: Colors.red,
              );
            }
          },
          builder: (context, state)
        {
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
                            isPassword:  AppLoginCubit.get(context).isPassword,
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
                            suffixIcon: IconButton(
                              icon: Icon(
                                AppLoginCubit.get(context).suffix,
                              ), onPressed: () {
                              AppLoginCubit.get(context).changePasswordVisibility();
                            },),

                            onFieldSubmitted: (p0) {
                             if(formKey.currentState!.validate())
                               {
                               AppLoginCubit.get(context).userLogin(
                                   email: emailController.text,
                                   password: passwordController.text,
                               );
                               }
                            },
                          ),
                          SizedBox(
                            height: 20,
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
                          SizedBox(
                            height: 20,
                          ),
                          Conditional.single(
                            context: context,
                            conditionBuilder: (context) => state is! AppLoginLoadingState,
                            widgetBuilder: (context) => defaultButton(
                              onPressed: () {
                                AppLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                );
                                if (formKey.currentState!.validate()) {
                                  AppLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );

                                }
                              },
                              text: 'Sign in',
                            ),
                            fallbackBuilder: (context) => Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
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
        },
      ),
    );
  }
}
