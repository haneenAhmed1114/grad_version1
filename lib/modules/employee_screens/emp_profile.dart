import 'package:flutter/material.dart';
import 'package:graduation_project/modules/employee_screens/edit_emp_profile.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';

import '../../models/employee_model.dart';

class EmployeeProfile extends StatelessWidget {
  static const String routeName = 'empProfileScreen';
  final EmployeeData empData;
  const EmployeeProfile({Key? key, required this.empData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Image.asset(
                        AppAssets.arrowBackIcon,
                        width: 18,
                        height: 18,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Employee Profile',
                          style: AppStyles.titleDrawerItem.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    customButtonIcon(
                      onPressed: () {},
                      backgroundColor: AppColors.redAppColor,
                      icon: ImageIcon(
                        AssetImage(AppAssets.deleteIcon),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        width: 10,
                    ),
                    customButtonIcon(
                      onPressed: () {},
                      icon: ImageIcon(
                        AssetImage(AppAssets.messageIcon),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    customButtonIcon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditEmployeeProfile(empData: empData,)),
                        );
                      },
                      icon: ImageIcon(
                        AssetImage(AppAssets.editIcon),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 80),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.filledColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          buildInfoItem('Name', empData.name),
                          buildInfoItem('Email', empData.email),
                          buildInfoItem('Phone', empData.phone),
                          buildInfoItem('hire date', empData.hireDate),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(AppAssets.hrImage),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                buildProfileSection(
                  items: [
                    buildInfoItem('department_id', empData.departmentId.toString()),
                    buildInfoItem('role_id', empData.roleId.toString()),
                    buildInfoItem('salary_id', empData.salaryId.toString()),
                    buildInfoItem('position_id', empData.positionId.toString()),
                  ],
                ),
                const SizedBox(height: 15),
                buildProfileSection(
                  items: [
                    Text('Employment Contract', style: AppStyles.empDataTitle),
                    const SizedBox(height: 8),
                    buildTwoButtonsRow('View', 'Download'),
                    const SizedBox(height: 16),
                    Text('National ID', style: AppStyles.empDataTitle),
                    const SizedBox(height: 8),
                    buildTwoButtonsRow('View', 'Download'),
                  ],
                ),
                const SizedBox(height: 15),
                defaultButton(
                  onPressed: () {},
                  text: 'Attendance and registration\nrecords for the last month',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: defaultButton(
                    onPressed: () {},
                    text: 'Vacations',
                  ),
                ),
                defaultButton(
                  onPressed: () {},
                  text: 'Evaluations and Notes',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.empDataTitle),
          Text(subtitle, style: AppStyles.subTitleStyle),
        ],
      ),
    );
  }

  Widget buildProfileSection({required List<Widget> items}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.filledColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }

  Widget buildTwoButtonsRow(String viewText, String downloadText) {
    return Row(
      children: [
        defaultButton(
          onPressed: () {},
          text: viewText,
          width: 78,
          height: 30,
          backgroundColor: AppColors.greyAppColor,
        ),
        const SizedBox(width: 15),
        defaultButton(
          onPressed: () {},
          text: downloadText,
          width: 130,
          height: 30,
          backgroundColor: AppColors.greyAppColor,
        ),
      ],
    );
  }
}

