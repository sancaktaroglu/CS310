import 'package:flutter/material.dart';
import 'package:untitled2/ui/notifications.dart';
import 'package:untitled2/ui/Dm.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';

AppBar welcomeBar(String text) {
  return AppBar(
    centerTitle: true,
    elevation: 10,
    title: Text(
      text,
      style: headingTextStyle,
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[AppColors.primary, AppColors.secondary],
        ),
      ),
    ),
  );
}

AppBar pageBar(BuildContext context){
  SizeConfig().init(context);
  return AppBar(
    centerTitle: true,
    elevation: 10,
    title: Text("Hot Pins",
        style: headingTextStyle),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[AppColors.primary, AppColors.secondary]
          )
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*5),
        child: GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, Notifications.routeName, (route) => false),
            child: const Icon(
              Icons.notification_add,
              size: 27,
            )
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*5),
        child: GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, Dm.routeName, (route) => false),
            child: const Icon(
              Icons.message,
              size: 27,
            )
        ),
      )
    ],
  );
}

AppBar dmBar(String text, BuildContext context){
  SizeConfig().init(context);
  return AppBar(
    centerTitle: true,
    elevation: 10,
    title: Row(
      children: [
        CircleAvatar(),
        SizedBox(
          width: SizeConfig.blockSizeHorizontal*5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: dmTextStyle,
            ),
          ],
        ),
      ],
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[AppColors.primary, AppColors.secondary],
        ),
      ),
    ),
  );
}


