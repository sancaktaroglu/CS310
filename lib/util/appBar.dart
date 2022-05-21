import 'package:flutter/material.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';

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

AppBar pageBar(BuildContext context, String routeName){
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
        padding: const EdgeInsets.only(right:20.0),
        child: GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false),
            child: const Icon(
              Icons.notification_add,
              size: 27,
            )
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right:20.0),
        child: GestureDetector(
            onTap: () => {},
            child: const Icon(
              Icons.message,
              size: 27,
            )
        ),
      )
    ],
  );
}


