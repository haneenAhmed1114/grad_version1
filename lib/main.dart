import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/home_layout.dart';
import 'package:graduation_project/modules/employee_screens/add_employee_screen.dart';
import 'package:graduation_project/modules/employee_screens/search_emp_screen.dart';
import 'package:graduation_project/modules/home_screen/home_screen.dart';
import 'package:graduation_project/modules/login/login_screen.dart';
import 'package:graduation_project/modules/reset_password/code_verification.dart';
import 'package:graduation_project/modules/reset_password/custom_new_password.dart';
import 'package:graduation_project/modules/reset_password/forgot_password.dart';
import 'package:graduation_project/modules/reset_password/password_updated_screen.dart';
import 'package:graduation_project/modules/vacations_screens/add_vacation_screen.dart';
import 'package:graduation_project/shared/network/remote/dio_helper.dart';
import 'package:graduation_project/shared/styles/app_theme.dart';
import 'package:graduation_project/shared/cubit/app_cubit.dart';
import 'package:graduation_project/models/employee_model.dart';

import 'modules/employee_screens/emp_profile.dart'; // ✅ لتعرف على EmployeeData

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        builder: DevicePreview.appBuilder,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (_) => LoginScreen(),
          ForgotPassword.routeName: (_) => ForgotPassword(),
          CodeVerification.routeName: (_) => CodeVerification(),
          CustomNewPassword.routeName: (_) => CustomNewPassword(),
          UpdatePasswordScreen.routeName: (_) => UpdatePasswordScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          HomeLayout.routeName: (_) => HomeLayout(),
          SearchEmpScreen.routeName: (_) => SearchEmpScreen(),
          AddEmployeeScreen.routeName: (_) => AddEmployeeScreen(),
          AddVacationScreen.routeName: (_) => AddVacationScreen(),
          EmployeeProfile.routeName: (context) {
            final empData = ModalRoute.of(context)!.settings.arguments as EmployeeData;
            return EmployeeProfile(empData: empData);
          },
        },
      ),
    );
  }
}

