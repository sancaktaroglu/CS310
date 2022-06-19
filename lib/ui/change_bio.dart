import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/classes/notif_card.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/services/analytics.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/feedPage.dart';

import '../model/Posts.dart';
import '../util/styles.dart';

class ChangeBio extends StatefulWidget {
  const ChangeBio({Key? key}) : super(key: key);


  @override
  State<ChangeBio> createState() => _ChangeBioState();

  static const String routeName = "/changeBio";
}

class _ChangeBioState extends State<ChangeBio> {


  final _formKey = GlobalKey<FormState>();
  String bioDone = "";
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');
  Future<void> changeBio(String bio) async{
    //DocumentSnapshot snapshot = await userCollection.doc(user.uid).get();
    userCollection.doc(user.uid).update({
      "bio": bio,
    });
    Navigator.pushNamedAndRemoveUntil(context, Profile.routeName, (route) => false);
  }
  @override
  Widget build(BuildContext context) {
    setCurrentScreen(analytics, "Change Bio", "change_bio.dart");
    return Scaffold(
      appBar: welcomeBar("Change Bio"),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SingleChildScrollView(),
            SizedBox(height: SizeConfig.screenHeight*0.3),
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
                        hintText: "Biography",
                        hintStyle: TextStyle(
                          height: 2.4,
                        ),
                        border: InputBorder.none,

                      ),


                      onSaved: (value) {
                        bioDone = value ?? '';

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
                      if (_formKey.currentState!.validate()) {
                        print(bioDone);
                        _formKey.currentState!.save();
                        changeBio(bioDone);
                      }


                    },
                    child: Text("Submit",
                      style: welcomeButtonTextStyle,),
                  )


              ),
            ),



          ],
        ),
      ),

    );
  }
}
