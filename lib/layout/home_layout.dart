import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/custom_drawer.dart';
import 'package:graduation_project/modules/employee_screens/employee_screen.dart';
import 'package:graduation_project/modules/home_screen/home_screen.dart';
import 'package:graduation_project/modules/notification_screen/notification_screen.dart';
import 'package:graduation_project/shared/cubit/app_cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  static const String routeName = 'homeScreen';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: AppStyles.titleDrawerItem.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundImage: AssetImage(AppAssets.hrImage),
                radius: 25,
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: cubit.bottomItems,
            ),
          ),
        );
      },
    );
  }


  Widget buildNavIcon(String assetPath, bool isSelected) {
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

}
