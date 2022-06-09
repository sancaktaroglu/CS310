import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';

String like = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU';
String comment = 'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png';
String share = 'https://cdn3.iconfinder.com/data/icons/virtual-notebook/16/button_share-512.png';
String follow = 'http://cdn.onlinewebfonts.com/svg/img_193993.png';
String follow_request = 'https://www.clipartmax.com/png/middle/319-3196434_request-friend-request-icon-png.png';




String sentence = '';
String link = '';
String chat_name = '';

class notifCard extends StatefulWidget {
  notifCard(
      this.x,
      {Key? key}) : super(key: key);


  Notif x;

  @override
  State<notifCard> createState() => _notifCardState();
}

class _notifCardState extends State<notifCard> {
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');

  void getInfo() async {
    DocumentSnapshot snapshot = await userCollection.doc(widget.x.otherUserId).get();
    chat_name = snapshot.get('fullname');
    setState( () {});
  }

  @override
  Widget build(BuildContext context) {
    getInfo();
    if (widget.x.notifType == 'like') {
      link = like;
      sentence = chat_name + " liked your post!";
    }

    else if (widget.x.notifType == 'comment') {
      link = comment;
      sentence = chat_name + " commented on your post!";
    }

    else if (widget.x.notifType == 'share'){
      link = share;
      sentence = chat_name + " shared your post!";
    }

    else if (widget.x.notifType == 'follow'){
      link = follow;
      sentence = chat_name + " followed you!";
    }

    else if (widget.x.notifType == "follow_request"){
      link = follow_request;
      sentence = chat_name + " has requested to follow you!";
    }


    return Card(
        color: AppColors.headingColor,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.blockSizeVertical * 2),
          child: Row(
            children: <Widget>[
              Image(
                image: NetworkImage(link),
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
}

