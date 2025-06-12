import 'package:flutter/material.dart';
import 'package:graduation_project/modules/vacations_screens/add_vacation_screen.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
        ),
        padding: const EdgeInsets.only(
          top: 46,
          bottom: 54,
          left: 21,
          right: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            AppAssets.hrImage,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Adam Sabry',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'HR Manager',
                      style: TextStyle(
                        color: AppColors.hrTextColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 40),
                    drawerItem(
                      icon: ImageIcon(
                        AssetImage(AppAssets.dashboardIcon),
                        color: Colors.white,
                        size: 24,
                      ),
                      title: 'Dashboard',
                      onTap: () {},
                    ),
                    drawerItem(
                      icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: ImageIcon(
                          AssetImage(AppAssets.jobPositionIcon),
                          color: Colors.white,
                        ),
                      ),
                      title: 'Job Position',
                      onTap: () {},
                    ),
                    drawerItem(
                      icon: ImageIcon(
                        AssetImage(AppAssets.salaryPayrollIcon),
                        color: Colors.white,
                      ),
                      title: 'Salary & Payroll',
                      onTap: () {},
                    ),
                    drawerItem(
                      icon: ImageIcon(
                        AssetImage(AppAssets.attendanceIcon),
                        color: Colors.white,
                      ),
                      title: 'Attendance',
                      onTap: () {},
                    ),
                    drawerItem(
                      icon: ImageIcon(
                        AssetImage(AppAssets.vacationIcon),
                        color: Colors.white,
                      ),
                      title: 'Vacations',
                      onTap: () {
                        Navigator.of(context).pushNamed(AddVacationScreen.routeName);
                      },
                    ),
                    drawerItem(
                      icon: ImageIcon(
                        AssetImage(AppAssets.reportIcon),
                        color: Colors.white,
                      ),
                      title: 'Reports',
                      onTap: () {},
                    ),
                    drawerItem(
                      icon: ImageIcon(
                        AssetImage(AppAssets.systemSettingIcon),
                        color: Colors.white,
                      ),
                      title: 'System Settings',
                      onTap: () {},
                    ),
                    const SizedBox(height: 40), // مسافة قبل الـ Logout
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // TODO: Logout
              },
              child: Container(
                width: 160,
                height: 54,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(48),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageIcon(
                      AssetImage(AppAssets.logoutIcon),
                      color: AppColors.primaryColor,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Logout',
                      style: AppStyles.titleDrawerItem.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

