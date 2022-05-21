import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';

  Future<void> showInfoDialog(String title, String message, BuildContext context) async {
    bool isAndroid = Platform.isAndroid;
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (isAndroid) {
            return AlertDialog(
              backgroundColor: AppColors.inputColor,
              title: Text(title,
              style: welcomeButtonTextStyle,
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(message,
                    style: welcomeButtonTextStyle,),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('YES',
                  style: welcomeButtonTextStyle,),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('NO',
                    style: welcomeButtonTextStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          } else {
            return CupertinoAlertDialog(
              title: Text(title, style: welcomeButtonTextStyle),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(message, style: headingTextStyle),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
        });
  }