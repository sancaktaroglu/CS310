import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/services/analytics.dart';
import 'package:untitled2/services/authentication.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/model/user.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/ui/post_card.dart';
import '../classes/post.dart';
import 'FeedPage.dart';
import 'package:untitled2/services/database.dart';

import '../util/styles.dart';
import 'add_comment.dart';

class OtherProfilePage extends StatefulWidget {
  const OtherProfilePage({this.data});

  final Map<String, dynamic>? data;

  @override
  State<OtherProfilePage> createState() => _OtherProfilePageState();
}

class _OtherProfilePageState extends State<OtherProfilePage> {

  List<Post> postsList = [];
  List<String> postIDList = [];
  List<String> userPostIDList = [];
  bool follows = false;
  bool requestSent = false;
  final x =Post(caption: 'Starbucks',
    date: 'January 20',
    likes: ["aasd", "asdfas"],
    dislikes: ["saldf", "asdfasd"],
    comments: ["asdfas", "asdf"],
    location: "Kadıköy",
    picture: "link",
    category: "asdfa",
    postId: "asdasd",
    userId: "asdfasd",
    postingTime: "sadfsd",
    title: "sdfdsg",

  );
  final user = FirebaseAuth.instance.currentUser!;
  final CollectionReference postCollection = FirebaseFirestore.instance.collection("Posts");
  Future<void> getPosts() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await postCollection.get();

    // Get data from docs and convert map to List
    //final postData = querySnapshot.docs.map((doc) => doc.data()).toList();

    //for a specific field
    final postID = querySnapshot.docs.map((doc) => doc.get('post_id')).forEach((element) {
      print(element);
      postIDList.add(element);
    });
    //print(postID);
    //postIDList.add(postID);
    for(var item in postIDList){
      DocumentSnapshot snapshot = await postCollection.doc(item).get();
      print("!!!!!!!!!!!!!!!!!!!");
      print(widget.data!['id']);
      print("!!!!!!!!!!!!!!!!!!!");
      if(snapshot.get('userid') == widget.data!['id']){
        userPostIDList.add(item);
      }
    }
    for(var item in userPostIDList){
      //print(item);

      DocumentSnapshot snapshot2 = await postCollection.doc(item).get();
      final ref = FirebaseStorage.instance.ref().child(snapshot2.get('picture'));
      var url = await ref.getDownloadURL();
      print(url);
      final currentPost =Post(
        caption: snapshot2.get('caption'),
        date: "",
        likes: List<String>.from(snapshot2.get('likes')),
        dislikes: List<String>.from(snapshot2.get('dislikes')),
        comments: List<String>.from(snapshot2.get('comments')),
        location: snapshot2.get('location'),
        picture: url,
        category: snapshot2.get('category'),
        postId: snapshot2.get('post_id'),
        userId: snapshot2.get('userid'),
        postingTime: snapshot2.get('time'),
        title: snapshot2.get('title'),
      );
      //print(currentPost.picture);
      postsList.add(currentPost);
      setState((){});

    }


  }
  Future<void> followStatus() async {
    var followerList = List<String>.from(widget.data!['Followers']);
    if(followerList.contains(user.uid)){
      follows = true;
    }
    setState((){});
  }
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('Users');
  Future<void> unFollow()async{
    var followerList = List<String>.from(widget.data!['Followers']);
    followerList.remove(user.uid);
    userCollection.doc(widget.data!['id']).update({
      'Followers': followerList,
    });
    follows = false;
    requestSent = false;
    setState((){});

  }
  Future<void> Follow() async{

    if(widget.data!['privateAccount'] == true){
      follows = false;
      requestSent = true;
    }
    else{
      follows = true;
    }

    setState((){});
  }
  Future<void> RequestCancel() async{
    follows = false;
    requestSent = false;
    setState((){});
  }
  @override
  void initState() {
    super.initState();
    //scrollController = FixedExtentScrollController(initialItem: selectedListIndex);
    getPosts();
    followStatus();

  }

  @override
  Widget build(BuildContext context) {

    int selectedIndex = 0;
    //final snapshot = FirebaseFirestore.instance.collection('customers').doc(user.uid).get();
    //OurUser? currentUser = Provider.of<OurUser?>(context);
    //print(currentUser!.method);


    void onTap(index) {
      setState(() {
        selectedIndex = index;
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
          Navigator.pushNamedAndRemoveUntil(context, ProfileEdit.routeName, (route) => false);
        }
        else if(index == 3)
        {

        }
        else if(index == 4)
        {
          Navigator.pushNamedAndRemoveUntil(context, Profile.routeName, (route) => false);
        }
      });
    }
    return Scaffold(
        appBar: AppBar(
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
              padding:  EdgeInsets.only(right: SizeConfig.blockSizeVertical*2),
              child: GestureDetector(
                  onTap: (){},
                  child: const Icon(
                    Icons.settings,
                    size: 27,
                  )
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: SizeConfig.blockSizeVertical),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeVertical*4, SizeConfig.blockSizeHorizontal*7, 0),
                          child: CircleAvatar(
                            radius: 60,
                            child: ClipOval(
                              child: Image.network(
                                widget.data!['profilepic'],
                                fit: BoxFit.fill,
                                width: SizeConfig.screenWidth/3,
                              ),
                            ),
                          ),
                        ),

                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, SizeConfig.blockSizeVertical*4, SizeConfig.blockSizeHorizontal*5, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [

                                  Text(
                                    widget.data!['username'],
                                    style: profileNameTextStyle,
                                  ),

                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [


                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Text(
                                          widget.data!['Posts'].length.toString(),
                                          style: profileTextStyle
                                      ),
                                    ),
                                    Text('Posts',
                                        style: profileTextStyle
                                    )
                                  ],
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal*5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Text(widget.data!['Followers'].length.toString(),
                                          style: profileTextStyle),
                                    ),
                                    Text('Follower',
                                        style: profileTextStyle)
                                  ],
                                ),
                                SizedBox(width: SizeConfig.blockSizeHorizontal*5),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:  [
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Text(widget.data!['Following'].length.toString(),
                                          style: profileTextStyle),
                                    ),
                                    Text('Following',
                                        style: profileTextStyle)
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                if(follows == true)
                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                    child: Container(
                                      height: SizeConfig.screenHeight/20,
                                      width: SizeConfig.screenWidth/2,
                                      margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*2),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: FlatButton(
                                          color: AppColors.mainColor,
                                          onPressed: () {
                                            unFollow();
                                          },
                                          child:
                                          Text(
                                            "Following",
                                            style: loginTextStyle,

                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                else if (follows == false && widget.data!['privateAccount'] == true && requestSent == true)
                                  Padding(
                                    padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                    child: Container(
                                      height: SizeConfig.screenHeight/20,
                                      width: SizeConfig.screenWidth/2,
                                      margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*2),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: FlatButton(
                                          color: AppColors.mainColor,
                                          onPressed: () {
                                            RequestCancel();
                                          },
                                          child:
                                          Text(
                                            "Requested",
                                            style: loginTextStyle,

                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                else
                                    Padding(
                                      padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical*2),
                                      child: Container(
                                        height: SizeConfig.screenHeight/20,
                                        width: SizeConfig.screenWidth/2,
                                        margin: EdgeInsets.only(top:SizeConfig.blockSizeVertical*2),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(80),
                                          child: FlatButton(
                                            color: AppColors.mainColor,
                                            onPressed: () {
                                              Follow();
                                            },
                                            child:
                                            Text(
                                              "Follow",
                                              style: loginTextStyle,

                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                              ],
                            ),

                          ],
                        ),
                      ]
                  ),
                  Column(
                      children: <Widget>[
                        for (int i=0; i<postsList.length; i++ )

                          card(x,
                              widget.data!['username'],
                              "",
                              postsList[i].postingTime,
                              postsList[i].location,
                              postsList[i].caption,
                              postsList[i].picture, (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddComment(data: postsList![i],)));},
                              context)

                      ]
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
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
          onTap: onTap,
        )

    );
  }
}
