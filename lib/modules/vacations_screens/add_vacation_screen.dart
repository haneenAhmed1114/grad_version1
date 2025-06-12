import 'package:flutter/material.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import '../../shared/styles/app_colors.dart';
import '../../shared/styles/app_styles.dart';

class AddVacationScreen extends StatefulWidget {
   AddVacationScreen({super.key});
  static const String routeName='vacation_screen';

  @override
  State<AddVacationScreen> createState() => _AddVacationScreenState();
}

class _AddVacationScreenState extends State<AddVacationScreen> {
  List<String> vacationTypes=[
    'Annual Leave',
    'Sick Leave',
    'Unpaid Leave',
    'Maternity/Paternity Leave',
    'Emergency Leave',
    'Study Leave',
  ];
  String selectedVacations='';
  bool isDropDownOpen = false;
  Map<String, bool> checkedMap = {};
  var reasonController = TextEditingController();
  var dateFromController = TextEditingController();
  var dateToController = TextEditingController();
  var vacationTypeController = TextEditingController();
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day ,DateTime focusDay){
setState(() {
  today = day ;
});
  }

  @override
  void initState() {
    super.initState();
    for (var type in vacationTypes) {
      checkedMap[type] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vacations',
          style: AppStyles.pageTitle,
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 90),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('vacation type : ', style: AppStyles.empDataTitle),
                    defaultFormField(
                      controller: vacationTypeController,
                      hintText: 'type',
                      type: TextInputType.none,
                      onTap: () {}, 
                      validator: (val) => null,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isDropDownOpen = !isDropDownOpen;
                          });
                        },
                        child: Icon(
                          isDropDownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        ),
                      ),
                    ),
                    if (isDropDownOpen)
                      CustomDropdown(
                        isDropdownOpen: isDropDownOpen,
                        checkedMap: checkedMap,
                        vacationTypes: vacationTypes,
                        onToggle: () {
                          setState(() {
                            isDropDownOpen = !isDropDownOpen;
                          });
                        },
                        onChanged: (type, val) {
                          setState(() {
                            checkedMap[type] = val;
                            // Update the text field with selected items
                            final selected = checkedMap.entries
                                .where((e) => e.value)
                                .map((e) => e.key)
                                .join(', ');
                            vacationTypeController.text = selected;
                          });
                        },

                      ),
                    Text('Duration :', style: AppStyles.empDataTitle),
                    Row(
                      children: [
                        Expanded(
                          child: defaultFormField(
                            controller: dateFromController ,
                            hintText: 'from',
                            type: TextInputType.datetime,
                            validator: (p0) {

                            },
                            onTap: () {

                            },
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: defaultFormField(
                            controller: dateToController ,
                            hintText: 'To',
                            type: TextInputType.datetime,
                            validator: (p0) {

                            },
                            onTap: () {

                            },
                          ),
                        ),
                      ],
                    ),
                    calendarTableItem(
                        focusedDay: today,
                        selectedDay: today,
                        onDaySelected: _onDaySelected,
                    ),

                    Text('Reason :', style: AppStyles.empDataTitle),
                    defaultFormField(
                        controller: reasonController,
                        type: TextInputType.text,
                        validator: (p0) {},
                    ),
                    Text('Document Upload :', style: AppStyles.empDataTitle),
                    defaultButton(onPressed: () {},
                      text: 'Add',
                      width: 78,
                      height: 30,
                      backgroundColor: AppColors.greyAppColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              defaultButton(onPressed: () {

              }, text: 'Submit Request'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:15.0),
                child: Text('All vacation requests',style: AppStyles.titleDrawerItem.copyWith(color: Colors.black),),
              ),
              vacationRequestItem(
                  vacationType: 'Sick Leave',
                  requestType: 'Approved',
                  iconPath: AppAssets.approvedIcon,
                iconColor: AppColors.greenAppColor,
              ),
              vacationRequestItem(
                  vacationType: 'Personal Leave',
                  requestType: 'Rejected',
                  iconPath: AppAssets.rejectedIcon,
                  iconColor: AppColors.redAppColor,
              ),
              vacationRequestItem(
                vacationType: 'Study Leave',
                requestType: 'pending',
                iconPath: AppAssets.pendingIcon,
                iconColor: AppColors.primaryColor,
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0,
                bottom: 15,
                ),
                child: defaultButton(onPressed: () {

                },
                    text: 'Today Vacations',
                  backgroundColor: AppColors.filledColor,
                  textColor: AppColors.primaryColor,
                  fontSize: 17,
                ),
              ),

              defaultButton(onPressed: () {

              }, text: 'Vacation requests review',
              iconWidget: ImageIcon(AssetImage(AppAssets.vacationReviewIcon,),
                color: Colors.white,
              ),
              ),

            ],
          ),
        ),
      ),)
    );
  }
}
