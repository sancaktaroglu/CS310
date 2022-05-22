import 'package:flutter/material.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';

Card notifCard(String link, String sentence, Notif x) {
  return Card(
      color: AppColors.headingColor,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
        child: Row(
          children: <Widget>[
            Image(
              image: NetworkImage(
                  link),
              width: SizeConfig.screenWidth * 0.06,
              height: SizeConfig.screenHeight * 0.06,
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.03),
            SizedBox(
              width: SizeConfig.screenWidth * 0.8,
              child: Text(
                sentence,
                style: notifTextStyle,
              ),
            ),
          ],
        ),
      ));
}
