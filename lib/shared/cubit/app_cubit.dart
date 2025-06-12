import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import '../../modules/employee_screens/employee_screen.dart';
import '../../modules/home_screen/home_screen.dart';
import '../../modules/notification_screen/notification_screen.dart';
import '../../modules/settings_screen/settings_screen.dart';
import '../network/remote/dio_helper.dart';
import '../styles/app_assets.dart';
import '../../models/employee_model.dart';  // Import EmployeeData model

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> get bottomItems => [
    BottomNavigationBarItem(
      icon: buildNavIcon(AppAssets.homeIcon, 0),
      label: 'home',
    ),
    BottomNavigationBarItem(
      icon: buildNavIcon(AppAssets.empIcon, 1),
      label: 'employee',
    ),
    BottomNavigationBarItem(
      icon: buildNavIcon(AppAssets.notificationIcon, 2),
      label: 'ring',
    ),
    BottomNavigationBarItem(
      icon: buildNavIcon(AppAssets.personIcon, 3),
      label: 'Settings',
    ),
  ];

  List<Widget> screens = [
    HomeScreen(),
    EmployeeScreen(),
    NotificationScreen(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'All employees',
    'Notifications',
    'Settings',
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  Widget buildNavIcon(String assetPath, int index) {
    bool isSelected = currentIndex == index;
    return isSelected
        ? Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: ImageIcon(
        AssetImage(assetPath),
        color: Colors.white,
        size: 28,
      ),
    )
        : ImageIcon(
      AssetImage(assetPath),
      color: AppColors.primaryColor,
      size: 28,
    );
  }

  List<EmployeeData> employees = [];

  void getEmployees() {
    emit(AppGetEmployeesLoadingState());

    DioHelper.getData(
      url: 'api/users',
    ).then((value) {
      print(value.data); // Debug print
      employees = List<EmployeeData>.from(
        value.data['data'].map((e) => EmployeeData.fromJson(e)),
      );
      emit(AppGetEmployeesSuccessState());
    }).catchError((error) {
      print('Error in getEmployees: ${error.toString()}');
      emit(AppGetEmployeesErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  Future<void> getSearchUsers(String query) async {
    if (query.isEmpty) {
      search = [];
      emit(AppGetSearchSuccessState());
      return;
    }

    emit(AppGetSearchLoadingState());

    try {
      final response = await DioHelper.getData(url: 'api/users');
      print('API response: ${response.data}');

      List<dynamic> users = response.data['data'] ?? [];
      print('Users List: $users');

      final filtered = users.where((user) {
        final name = user['name']?.toString().toLowerCase() ?? '';
        final email = user['email']?.toString().toLowerCase() ?? '';
        final searchTerm = query.toLowerCase().trim();
        return name.contains(searchTerm) || email.contains(searchTerm);
      }).toList();

      search = filtered.map((e) => EmployeeData.fromJson(e)).toList();
      print('Search results: $search');

      emit(AppGetSearchSuccessState());
    } catch (e) {
      emit(AppGetSearchErrorState(e.toString()));
    }
  }


}

