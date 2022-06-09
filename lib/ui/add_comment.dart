import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

import '../model/Posts.dart';
import '../util/styles.dart';

class AddComment extends StatefulWidget {
  const AddComment({Key? key, required this.data}) : super(key: key);
  static const String routeName = "/addComment";
  //const AddComment({required this.data});

  final Post data;

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {

  final _formKey = GlobalKey<FormState>();
  String commentDone = "";

  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference postCollection = FirebaseFirestore.instance.collection('Posts');


  Future<void> addComment(String comment) async{
    DocumentReference ref = FirebaseFirestore.instance.collection('Comments').doc();
    ref.set({
      'comment': comment,
      'id': ref.id,
      'post_id': widget.data.postId,
    });
    DocumentSnapshot snapshot2 = await postCollection.doc(widget.data.postId).get();
    var commentArray = List<String>.from(snapshot2.get('comments'));
    print(commentArray);
    commentArray.add(comment);
    print(commentArray);
    postCollection.doc(widget.data.postId).update({
      "comments": commentArray,
    });
  }
  @override
  Widget build(BuildContext context) {


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
      body: Form(
        key: _formKey,
        child: Column(
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
                      if (_formKey.currentState!.validate()) {
                        print(commentDone);
                        _formKey.currentState!.save();
                        addComment(commentDone);
                      }


                    },
                    child: Text("Add Comment",
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