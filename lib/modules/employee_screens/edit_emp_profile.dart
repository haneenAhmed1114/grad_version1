import 'package:flutter/material.dart';
import 'package:graduation_project/modules/employee_screens/emp_profile.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import '../../models/employee_model.dart';
import '../../shared/styles/app_colors.dart';
import '../../shared/styles/app_styles.dart';

class EditEmployeeProfile extends StatefulWidget {
  static const String routeName = 'editEmpProfile';

  final EmployeeData empData;

  const EditEmployeeProfile({Key? key, required this.empData}) : super(key: key);

  @override
  State<EditEmployeeProfile> createState() => _EditEmployeeProfileState();
}



class _EditEmployeeProfileState extends State<EditEmployeeProfile> {
  @override
  void initState() {
    super.initState();
    nameController.text = widget.empData.name;
    emailController.text = widget.empData.email;
    phoneController.text = widget.empData.phone;
    hireDateController.text = widget.empData.hireDate;
    departmentController.text=widget.empData.departmentId.toString();
    roleController.text = widget.empData.roleId.toString();
    salaryController.text=widget.empData.salaryId.toString();
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var departmentController = TextEditingController();
  var salaryController = TextEditingController();
  var hireDateController = TextEditingController();
  var roleController = TextEditingController();

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
                          Navigator.of(context).pushNamed(EmployeeProfile.routeName);
                        },
                        icon: Image.asset(
                          AppAssets.arrowBackIcon,
                          width: 18,
                          height: 18,
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        'Editing Employee Profile',
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
                              controller: hireDateController,
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
                              backgroundImage: AssetImage(AppAssets.hrImage),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {

                                },
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
                        Text('department_id', style: AppStyles.empDataTitle),
                        defaultFormField(
                          controller: departmentController,
                          type: TextInputType.text,
                          validator: (p0) {},
                        ),
                        Text('role_id', style: AppStyles.empDataTitle),
                        defaultFormField(
                          controller: roleController,
                          type: TextInputType.text,
                          validator: (p0) {},
                        ),
                        Text('Salary_id', style: AppStyles.empDataTitle),
                        defaultFormField(
                          controller: salaryController,
                          type: TextInputType.number,
                          validator: (p0) {},
                        ),
                        Text('Hiring Date', style: AppStyles.empDataTitle),
                        defaultFormField(
                          controller: hireDateController,
                          type: TextInputType.datetime,
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
        ),
      ),
    );
  }
}
