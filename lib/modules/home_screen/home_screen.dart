
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/modules/employee_screens/add_employee_screen.dart';
import 'package:graduation_project/shared/reusabale_components/reusable_components.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_colors.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';

import '../../models/dashboard_card_model.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

   static const String routeName='homeScreen';
  final List<DashboardCardModel> dashboardCards = [
    DashboardCardModel(title: 'Total employees', value: '5000', percent: '0.4%'),
    DashboardCardModel(title: 'Attendance', value: '4500', percent: '90%'),
    DashboardCardModel(title: 'Vacation', value: '20', percent: '0.4%'),
    DashboardCardModel(title: 'Lateness & Absence', value: '480', percent: '9.6%'),
  ];
   final List<Map<String, dynamic>> cardItems = [
     {
       'title': 'Vacation\nreview',
       'icon': Image.asset(AppAssets.vacationReviewIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Add a new\nemployee',
       'icon': Image.asset(AppAssets.addEmpIcon,width: 19,height: 22,color: Colors.white),
     },
     {
       'title': 'Reports',
       'icon': Image.asset(AppAssets.reportIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Message an\nemployee',
       'icon': Image.asset(AppAssets.messageEmpIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Notify a\nDepartment',
       'icon': Image.asset(AppAssets.notifyDepartIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Notify all\nemployees',
       'icon': Image.asset(AppAssets.notifyEmpIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Add bonus\nor deduction',
       'icon': Image.asset(AppAssets.addBonusReductionIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Schedule a\nmeeting',
       'icon': Image.asset(AppAssets.scheduleMeetingIcon, width: 19, height: 22, color: Colors.white),
     },
     {
       'title': 'Employee\nwarning',
       'icon': Image.asset(AppAssets.empWarningIcon, width: 19, height: 22, color: Colors.white),
     },
   ];


   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: AppStyles.pageTitle.copyWith(fontSize: 22.75),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Expanded(child: buildInfoCard(dashboardCards[0])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: buildInfoCard(dashboardCards[1])),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(child: buildInfoCard(dashboardCards[2])),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: buildInfoCard(dashboardCards[3])),
              ],
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              'Weekly attendance rate',
              style: AppStyles.pageTitle.copyWith(fontSize: 22.75),
            ),
            Container(
              height: 250,
              color: AppColors.filledColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (value, _) {
                            final days = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu'];
                            if (value.toInt() >= 0 && value.toInt() < days.length) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  days[value.toInt()],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 5,
                    minY: 0,
                    maxY: 100,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 85),
                          FlSpot(1, 90),
                          FlSpot(2, 88),
                          FlSpot(3, 92),
                          FlSpot(4, 87),
                          FlSpot(5, 95),
                        ],
                        isCurved: true,
                        color: Colors.white,
                        barWidth: 8, // ⬅️ Make it bolder here
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          color:AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 22,
            ),
            SizedBox(
              height: 500,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: GridView.builder(
                  itemCount: cardItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 15,
                    childAspectRatio: 12/16,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = cardItems[index];
                    return buildCard(item['title'], item['icon'],() {
                       if(item['title'] == 'Add a new\nemployee')
                        {
                          Navigator.of(context).pushNamed(AddEmployeeScreen.routeName);
                        }
                    },);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
