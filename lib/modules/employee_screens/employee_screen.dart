import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:graduation_project/modules/employee_screens/search_emp_screen.dart';
import 'package:graduation_project/shared/cubit/app_cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';


class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({Key? key}) : super(key: key);

  static const String routeName = 'empScreen';

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).employees;
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        navigateTo(context, SearchEmpScreen.routeName);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.filledColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Icon(Icons.search),
                          title: Text('Search'),
                          trailing:ImageIcon(AssetImage(AppAssets.suffixSearchIcon),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  customButtonIcon(onPressed: () {

                  },
                  icon: Icon(Icons.add,color: Colors.white,),
                      ),],
              ),
            ),
            Expanded(
              child: Conditional.single(
              context: context,
              conditionBuilder: (context) => state is! AppGetEmployeesLoadingState,
              widgetBuilder: (context) => list.isEmpty
                  ? Center(child: Text('No employees found'))
                  : ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    empCardItem(empData: list[index], context: context),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: list.length,
              ),
              fallbackBuilder: (context) => Center(
                child: CircularProgressIndicator(color: AppColors.primaryColor),
              ),
                      ),
            ),
            ],
          ),
        );
      },
    );
  }
}



