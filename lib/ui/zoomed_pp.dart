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

class ZoomedProfilePicture extends StatefulWidget {
  const ZoomedProfilePicture({Key? key, required this.data}) : super(key: key);
  static const String routeName = "/zoomedPp";
  final String data;

  @override
  State<ZoomedProfilePicture> createState() => _ZoomedProfilePictureState();
}

class _ZoomedProfilePictureState extends State<ZoomedProfilePicture> {
  @override
  Widget build(BuildContext context) {
    setCurrentScreen(analytics, "Profile photo", "zoomed_pp.dart");
    return Scaffold(
      appBar: welcomeBar("Hot Pins"),
      body: Center(
        child: Container(
          child: Image.network(
              widget.data,
          ),
        ),
      )

    );
  }
}
