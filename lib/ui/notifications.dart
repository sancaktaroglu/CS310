import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

import 'bottom_map.dart';
import 'create_post_text.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static const String routeName = "/notificaton";

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  List <Notif> notifs = [
  ];
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference notifCollection = FirebaseFirestore.instance.collection('Notifications');
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');


  Future<void> getNotif() async{
    String uid = user.uid;

    QuerySnapshot querySnapshot = await notifCollection.get();

    final chat = querySnapshot.docs.forEach((element) {

      if(element['user_id'] == uid){
        print(element['notif_type']);
        notifs.add(Notif(userId: uid, otherUserId: element['other_user_id'], notifType: element['notif_type'], postId: element['post_id'], doc_id: element['id']));
      }
    });

    setState( () {});

  }

  bool check = true;

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    if (check) {
      getNotif();
      check = false;
    }



    void _ONTAP(index) {
      setState(() {
        _selectedIndex = index;
        if(index == 0)
        {
          Navigator.pushNamedAndRemoveUntil(context, FeedPage.routeName, (route) => false);
        }
        else if(index == 1)
        {
          Navigator.pushNamedAndRemoveUntil(context, ExploreScreen.routeName, (route) => false);
        }
        else if(index == 2)
        {
          Navigator.pushNamed(context, BottomMap.routeName);

        }
        else if(index == 3)
        {
          Navigator.pushNamedAndRemoveUntil(context, CreatePostText.routeName, (route) => false);
        }
        else if(index == 4)
        {
          Navigator.pushNamedAndRemoveUntil(context, Profile.routeName, (route) => false);
        }
      });
    }
    SizeConfig().init(context);
    setCurrentScreen(analytics, "Notification Page", "notifications.dart") ;

    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: welcomeBar("Notifications"),
      body: ListView.builder(
        itemCount: notifs.length,
          itemBuilder: (context, index) => notifCard(notifs[index]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppColors.mainColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Map',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',


          ),
        ],
        onTap: _ONTAP,
      ),
    );
  }
}