import 'package:flutter/material.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';
import '../../shared/reusabale_components/reusable_components.dart';
import '../../shared/styles/app_assets.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Today',
            style:AppStyles.pageTitle.copyWith(fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemBuilder: (context, index) => empCardItem(
          //         context: context,
          //         name: 'Adam Sabry',
          //         imagePath: AppAssets.hrImage,
          //         description: 'hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh',
          //         time: '2:00',
          //     ),
          //     itemCount: 10,
          //   ),
          // ),
        ],
      ),
    );
  }
}
