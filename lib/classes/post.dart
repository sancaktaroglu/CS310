import 'package:flutter/material.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';

Card card(Post post,String name, String surname, String date, String location, String comment, String link, BuildContext context) {
  SizeConfig().init(context);
  return Card(
    child: SizedBox(
      height: SizeConfig.screenHeight/2,
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical*3),
          ListTile(
            leading: const CircleAvatar(
            ),
            title: Text("$name $surname"),
            subtitle: Text("$post \n$location"),
            trailing: const Icon(Icons.bookmark, color: AppColors.secondary),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              comment,
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(link),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(Icons.thumb_up, color: AppColors.secondary),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                  Text(
                    "Like",
                    style: cardTextStyle,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.thumb_down, color: AppColors.secondary),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                  Text(
                    "Dislike",
                    style: cardTextStyle,
                  ),
                ],
              ),
              Row(
                children:  <Widget>[
                  const Icon(Icons.comment, color: AppColors.secondary),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                  Text(
                    "Comment",
                    style: cardTextStyle,
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.share, color: AppColors.secondary),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                  Text(
                    "Share",
                    style: cardTextStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*4,),
        ],
      ),
    ),
  );
}
