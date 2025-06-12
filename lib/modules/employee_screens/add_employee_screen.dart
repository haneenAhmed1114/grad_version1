import 'package:flutter/material.dart';
import 'package:graduation_project/modules/home_screen/home_screen.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';
import '../../shared/reusabale_components/reusable_components.dart';
import '../../shared/styles/app_colors.dart';

class AddEmployeeScreen extends StatefulWidget {
  const AddEmployeeScreen({super.key});
  static const String routeName = 'addEmpScreen';

  @override
  State<AddEmployeeScreen> createState() => _AddEmployeeScreenState();
}

class _AddEmployeeScreenState extends State<AddEmployeeScreen> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var jobTitleController = TextEditingController();
  var departmentController = TextEditingController();
  var managerController = TextEditingController();
  var salaryController = TextEditingController();
  var hireDateController = TextEditingController();
  var jobGradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(HomeScreen.routeName);
                      },
                      icon: Image.asset(
                        AppAssets.arrowBackIcon,
                        width: 18,
                        height: 18,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Add Employee',
                      style: AppStyles.titleDrawerItem.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 90),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.filledColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name', style: AppStyles.empDataTitle),
                          defaultFormField(
                            controller: nameController,
                            type: TextInputType.text,
                            validator: (p0) {},
                          ),
                          Text('Email', style: AppStyles.empDataTitle),
                          defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validator: (p0) {},
                          ),
                          Text('Phone', style: AppStyles.empDataTitle),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validator: (p0) {},
                          ),
                          Text('Address', style: AppStyles.empDataTitle),
                          defaultFormField(
                            controller: addressController,
                            type: TextInputType.text,
                            validator: (p0) {},
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 - 75,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: AppColors.primaryColor,
                            child: Text(
                              'Add Picture',
                              style: AppStyles.titleDrawerItem.copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 21,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: AppColors.primaryColor,
                                child: ImageIcon(
                                  AssetImage(AppAssets.editIcon),
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.filledColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Job Title',
                          style: AppStyles.empDataTitle),
                      defaultFormField(
                        controller: jobTitleController,
                        type: TextInputType.text,
                        validator: (p0) {},
                      ),
                      Text('Department',
                          style: AppStyles.empDataTitle),
                      defaultFormField(
                        controller: departmentController,
                        type: TextInputType.text,
                        validator: (p0) {},
                      ),
                      Text('Direct Manager',
                          style: AppStyles.empDataTitle),
                      defaultFormField(
                        controller: managerController,
                        type: TextInputType.text,
                        validator: (p0) {},
                      ),
                      Text('Salary', style: AppStyles.empDataTitle),
                      defaultFormField(
                        controller: salaryController,
                        type: TextInputType.number,
                        validator: (p0) {},
                      ),
                      Text('Hiring Date',
                          style: AppStyles.empDataTitle),
                      defaultFormField(
                        controller: hireDateController,
                        type: TextInputType.datetime,
                        validator: (p0) {},
                      ),
                      Text('Job Grade',
                          style: AppStyles.empDataTitle),
                      defaultFormField(
                        controller: jobGradeController,
                        type: TextInputType.text,
                        validator: (p0) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.filledColor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Employment Contract',
                          style: AppStyles.empDataTitle),
                      defaultButton(
                        onPressed: () {},
                        text: 'View',
                        width: 78,
                        height: 30,
                        backgroundColor: AppColors.greyAppColor,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text('National ID', style: AppStyles.empDataTitle),
                      defaultButton(
                        onPressed: () {},
                        text: 'View',
                        width: 78,
                        height: 30,
                        backgroundColor: AppColors.greyAppColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
