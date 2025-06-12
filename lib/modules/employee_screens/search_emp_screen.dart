import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/shared/cubit/app_cubit.dart';
import 'package:graduation_project/shared/cubit/states.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';
import '../../models/employee_model.dart';
import '../../shared/styles/app_assets.dart';

class SearchEmpScreen extends StatelessWidget {
  SearchEmpScreen({super.key});
  static const String routeName = 'searchEmpScreen';
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<AppCubit>();

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: ImageIcon(AssetImage(AppAssets.arrowBackIcon)),
            ),
            title: Text(
              'Search',
              style: AppStyles.pageTitle.copyWith(fontSize: 25),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  prefixIcon: Icons.search_rounded,
                  prefixIconColor: Colors.black,
                  hintText: 'Search',
                  suffixIcon: ImageIcon(AssetImage(AppAssets.suffixSearchIcon)),
                  onChanged: (value) => cubit.getSearchUsers(value),
                ),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (state is AppGetSearchLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is AppGetSearchErrorState) {
                      return Center(child: Text('Error: ${state.error}'));
                    }
                    if (cubit.search.isEmpty &&
                        searchController.text.isNotEmpty) {
                      return Center(
                        child: Text(
                          'No results found',
                          style: AppStyles.subTitleStyle.copyWith(fontSize: 18),
                        ),
                      );
                    }
                    return ListView.builder(
                      itemCount: cubit.search.length,
                      itemBuilder: (context, index) {
                        final employee = cubit.search[index] as EmployeeData;
                        return empCardItem(
                          empData: employee,
                          context: context,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

