
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/models/dashboard_card_model.dart';
import 'package:graduation_project/models/employee_model.dart';
import 'package:graduation_project/modules/employee_screens/emp_profile.dart';
import 'package:graduation_project/shared/styles/app_assets.dart';
import 'package:graduation_project/shared/styles/app_styles.dart';
import 'package:table_calendar/table_calendar.dart';
import '../styles/app_colors.dart';

//*****************************************************

Widget defaultButton({
  double width = double.infinity,
  double? height = 55,
  Color backgroundColor = AppColors.primaryColor,
  required void Function()? onPressed,
  required String text,
  double? fontSize = 20,
  Color textColor = Colors.white,
  bool isUpperCase = false,
  double radius = 10.0,
  bool isBorder = false,
  Widget? iconWidget,
  bool isIconAtEnd = false,
})
{
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
      border: isBorder ? Border.all(color: AppColors.primaryColor, width: 2) : null,
    ),
    child: MaterialButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconWidget != null && !isIconAtEnd) ...[
            iconWidget,
            const SizedBox(width: 8),
          ],
          Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w700,
              fontSize: fontSize,
            ),
          ),
          if (iconWidget != null && isIconAtEnd) ...[
            const SizedBox(width: 8),
            iconWidget,
          ],
        ],
      ),
    ),
  );
}

//*****************************************************


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onFieldSubmitted,
  void Function(String)? onChanged,
  required String? Function(String?)? validator,
  void Function()? onTap ,
  String? hintText,
  bool isPassword = false,
  IconData? prefixIcon,
  Widget? suffixIcon,
  void Function()? suffixPressed,
  Color prefixIconColor = AppColors.primaryColor,
}) => TextFormField(
  cursorColor: AppColors.primaryColor,
  keyboardType: type,
  controller: controller,
  obscureText: isPassword,
  decoration: InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(
      color: AppColors.greyAppColor,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.errorBorderColor,
        width: 2,
      ),
    ),
    suffixIcon: suffixIcon != null
        ? GestureDetector(
      onTap: suffixPressed,
      child: suffixIcon,
    )
        : null,
    prefixIcon: Icon(
      prefixIcon,
      size: 25,
      color: prefixIconColor,
    ),
    fillColor: AppColors.filledColor,
    filled: true,
  ),
  onFieldSubmitted: onFieldSubmitted,
  onChanged: onChanged,
  validator: validator,
  onTap:onTap,
);



//*****************************************************

Widget OtpTextField(context)=>SizedBox(
  height: 50,
  width: 50,
  child: TextFormField(
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.filledColor,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.primaryColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: AppColors.errorBorderColor,
          width: 2,
        ),
      ),
    ),
    inputFormatters: [
      LengthLimitingTextInputFormatter(1),
      FilteringTextInputFormatter.digitsOnly,
    ],
    onChanged: (value) {
      if(value.length==1)
        {
          FocusScope.of(context).nextFocus();
        }
    },
  ),
);


//*****************************************************

Widget customDivider({required Color firstColor,required Color secondColor,required double firstPosition,required double secondPosition})=>Container(
  height: 3, // Adjust thickness
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
       firstColor,
       secondColor,
      ],
      stops: [
       firstPosition,
        secondPosition,
      ],
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ),
  ),
);


//*****************************************************


Widget drawerItem({
  required Widget icon,
  required String title,
  required void Function()? onTap,
}) => Padding(
  padding: const EdgeInsets.only(
    top: 10,
    bottom: 10,
  ),
  child: ListTile(
    leading: SizedBox(
      width: 30,
      height: 30,
      child: icon,
    ),
    title: Text(
      title,
      style: AppStyles.titleDrawerItem,
    ),
    onTap: onTap,
  ),
);

//*****************************************************
 Widget buildInfoCard(DashboardCardModel cardModel)=>Container(
   padding: const EdgeInsets.all(12),
   decoration:BoxDecoration(
     color: AppColors.filledColor,
     borderRadius: BorderRadius.circular(12),
   ),
   child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: [
       Text(
         cardModel.title as String,
         style: AppStyles.passInstructionStyle.copyWith(fontWeight: FontWeight.w600),
       ),
       const SizedBox(
         height: 8,
       ),
       Row(
         children: [
           Text(
             cardModel.value as String,
             style: AppStyles.titleDrawerItem.copyWith(color: Colors.black),
           ),
           Spacer(),
           Text(
             cardModel.percent as String,
             style: AppStyles.percentCardStyle,
           ),
         ],
       ),
   ],
 ),
 );

//*****************************************************


Widget buildCard(String title, Widget iconWidget, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 112,
      width: 105,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.percentCardStyle.copyWith(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}


//*****************************************************

Widget customButtonIcon({
  double width = 44,
  double height = 44,
  Color backgroundColor = AppColors.primaryColor,
  required void Function()? onPressed,
  dynamic icon, // Can be IconData or Widget
  double radius = 10.0,
  Color color = Colors.white,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      padding: EdgeInsets.zero,
      child: icon is IconData
          ? Icon(
        icon,
        color: color,
        size: 20,
      )
          : icon is Widget
          ? icon
          : SizedBox.shrink(), // fallback
    ),
  );
}


//*****************************************************

Widget empCardItem({
  required EmployeeData empData,
  required BuildContext context,
  void Function()? onTap,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: onTap ??
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EmployeeProfile(empData: empData),
                ),
              );
            },
        child: Row(
          children: [
            Container(
              width: 57,
              height: 57,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: DecorationImage(
                  image: AssetImage(AppAssets.hrImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    empData.name,
                    style: AppStyles.titleDrawerItem.copyWith(color: Colors.black),
                  ),
                  Text(
                    empData.phone,
                    style: AppStyles.passInstructionStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: AppColors.greyAppColor,
              ),
            ),
          ],
        ),
      ),
    );

//*****************************************************

void navigateTo(context,widget)=>Navigator.of(context).pushNamed(widget);

//*****************************************************


Widget calendarTableItem({
  required DateTime focusedDay,
  required DateTime selectedDay,
  required Function(DateTime selectedDay, DateTime focusedDay) onDaySelected,
}) {
  return Container(
    child: TableCalendar(
      locale: 'en_US',
      rowHeight: 43,
      headerStyle: const HeaderStyle(formatButtonVisible: false),
      availableGestures: AvailableGestures.all,
      selectedDayPredicate: (day) => isSameDay(day, selectedDay),
      onDaySelected: onDaySelected,
      focusedDay: focusedDay,
      firstDay: DateTime.utc(2025, 1, 24),
      lastDay: DateTime.utc(2025, 12, 24),
    ),
  );
}


//*****************************************************

Widget CustomDropdown({
  required bool isDropdownOpen,
  required Map<String, bool> checkedMap,
  required List<String> vacationTypes,
  required VoidCallback onToggle,
  required Function(String, bool) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (isDropdownOpen)
        Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor,width: 2),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: vacationTypes.map((type) {
              return CheckboxListTile(
                checkColor: Colors.white,
                activeColor: AppColors.primaryColor,
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(type, style: const TextStyle(fontSize: 14)),
                value: checkedMap[type],
                onChanged: (val) {
                  onChanged(type, val!);
                  // Optional: Auto close after selection (single-select)
                  //onToggle();
                },
              );
            }).toList(),
          ),
        ),
    ],
  );
}

//*****************************************************


Widget vacationRequestItem({required String vacationType,required String requestType,required String iconPath,required Color iconColor})=>Padding(
  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child: Container(
    decoration: BoxDecoration(
      color: AppColors.filledColor,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(vacationType,style: AppStyles.empDataTitle.copyWith(fontWeight: FontWeight.w700,fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage(
                    iconPath,
                ),
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(requestType,style: AppStyles.passInstructionStyle.copyWith(fontSize: 16,fontWeight: FontWeight.w600),),
            ],
          ),
        ],
      ),
    ),
  ),
);


//*****************************************************

void showToast({required String message, required Color color}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

//*****************************************************

bool isValidEmail(String inputEmail) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(inputEmail);
}

//*****************************************************
