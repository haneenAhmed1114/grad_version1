import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/models/login_model.dart';
import 'package:graduation_project/modules/login/cubit/states.dart';
import 'package:graduation_project/shared/network/remote/dio_helper.dart';
import 'package:graduation_project/shared/network/remote/end_points.dart';

class AppLoginCubit extends Cubit<AppLoginStates> {
  AppLoginCubit() : super(AppLoginInitialState());

  static AppLoginCubit get(context) => BlocProvider.of(context);

  AppLoginModel? loginModel;
  String? token;  // نخزن التوكين هنا

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(AppLoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = AppLoginModel.fromJson(value.data);
      token = loginModel!.token;

      DioHelper.token = token;

      emit(AppLoginSuccessState(loginModel!));
    }).catchError((error) {
      print('Login error: $error');
      if (error is DioException) {
        if (error.response?.statusCode == 401) {
          emit(AppLoginErrorState('لم نتمكن من تسجيل الدخول، برجاء التأكد من البيانات المدخلة.'));
        } else {
          emit(AppLoginErrorState('حدث خطأ في الخادم: ${error.response?.statusCode}'));
        }
      } else {
        emit(AppLoginErrorState('حدث خطأ غير متوقع، حاول لاحقاً.'));
      }
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(AppChangePasswordVisibilityState());
  }


}
