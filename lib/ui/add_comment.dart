import 'package:flutter/material.dart';
import 'package:untitled2/classes/notif_card.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/feedPage.dart';

import '../util/styles.dart';

class AddComment extends StatefulWidget {
  const AddComment({Key? key}) : super(key: key);
  static const String routeName = "/addComment";

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  @override
  Widget build(BuildContext context) {
    String commentDone = "";

    SizeConfig().init(context);
    String like = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU';
    String comment = 'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png';
    Notif x = Notif(
      userId: "1",
      otherUserId: "2",
      notifType: 2,
      postId: "3",
    );
    return Scaffold(
        appBar: welcomeBar("Comments"),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: notifCard(comment,
                "AhseniHamza commented on your post!",
                x
            ),
          ),
          Spacer(),
          Container(
              height: SizeConfig.screenHeight/8,
              margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*5,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: AppColors.inputColor,
                  padding: EdgeInsets.all(SizeConfig.blockSizeHorizontal),
                  child: TextFormField(
                    maxLines: 3,
                    cursorColor: AppColors.textColor,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.comment,
                        color: AppColors.textColor,
                      ),
                      hintText: "Type Here",
                      hintStyle: TextStyle(
                        height: 2.4,
                      ),
                      border: InputBorder.none,

                    ),

                    onSaved: (value) {
                      commentDone = value ?? '';

                    },
                  ),
                ),
              )
          ),
          SizedBox(height: 0,),
          Container(
            height: SizeConfig.screenHeight/15,
            margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal*10,vertical: 20),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: FlatButton(
                  color: AppColors.buttonColor,
                  onPressed: () {

                  },
                  child: Text("Add Comment",
                    style: welcomeButtonTextStyle,),
                )


            ),
          ),



        ],
      ),

    );
  }
}