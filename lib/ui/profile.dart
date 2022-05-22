import 'package:flutter/material.dart';
import 'package:untitled2/model/notif.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/model/user.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/ui/post_card.dart';
import 'FeedPage.dart';





void main() => runApp(const Profile());

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  void _goSettingPage(){
    Navigator.pushNamedAndRemoveUntil(context, ProfileEdit.routeName, (route) => false);
  }


  User user1  = User(
    follower: ["asd", "asdfas"],
    following: ["adfas", "asdfasd"],
    posts: [
  Post(text: 'Starbucks',
  date: 'January 20',
  likes: ["aasd", "asdfas"],
  dislikes: ["saldf", "asdfasd"],
  comments: ["asdfas", "asdf"],
  location: "Kadıköy",
  picture: "link",
  topic: "asdfa",
  userId: "asdfasd",
  postingTime: "sadfsd"

  ),

  Post(text: 'Starbucks',
  date: 'January 20',
  likes: ["aasd", "asdfas"],
  dislikes: ["saldf", "asdfasd"],
  comments: ["asdfas", "asdf"],
  location: "Kadıköy",
  picture: "link",
  topic: "asdfa",
  userId: "asdfasd",
  postingTime: "sadfsd"

  ),

  Post(text: 'Starbucks',
  date: 'January 20',
  likes: ["aasd", "asdfas"],
  dislikes: ["saldf", "asdfasd"],
  comments: ["asdfas", "asdf"],
  location: "Kadıköy",
  picture: "link",
  topic: "asdfa",
  userId: "asdfasd",
  postingTime: "sadfsd"

  ),

  ],
  userId: "asdfas",
  username:  "asdfasdf",
  email: "asdfas@sabanciuniv.edu",
  private: false,
  password: "asdfasd",
  fullName: "asdfasd asdvfasd",
  bio: "Sabancı Uni",
  bookmark: [
  Post(text: 'Starbucks',
  date: 'January 20',
  likes: ["aasd", "asdfas"],
  dislikes: ["saldf", "asdfasd"],
  comments: ["asdfas", "asdf"],
  location: "Kadıköy",
  picture: "link",
  topic: "asdfa",
  userId: "asdfasd",
  postingTime: "sadfsd"

  ),

  Post(text: 'Starbucks',
  date: 'January 20',
  likes: ["aasd", "asdfas"],
  dislikes: ["saldf", "asdfasd"],
  comments: ["asdfas", "asdf"],
  location: "Kadıköy",
  picture: "link",
  topic: "asdfa",
  userId: "asdfasd",
  postingTime: "sadfsd"

  ),

  Post(text: 'Starbucks',
  date: 'January 20',
  likes: ["aasd", "asdfas"],
  dislikes: ["saldf", "asdfasd"],
  comments: ["asdfas", "asdf"],
  location: "Kadıköy",
  picture: "link",
  topic: "asdfa",
  userId: "asdfasd",
  postingTime: "sadfsd"

  ),

  ],

  notifications: [
  Notif(
  userId: "1",
  otherUserId: "2",
  notifType: 2,
  postId: "3",
  ),
  Notif(
  userId: "1",
  otherUserId: "2",
  notifType: 2,
  postId: "3",
  ),
  Notif(
  userId: "1",
  otherUserId: "2",
  notifType: 2,
  postId: "3",
  ),
  ],

  );

  void deletePost(Post post) {
    setState(() {
      user1.posts.remove(post);
    });
  }

  void LikeIncrementer(Post post){
    setState(() {
      int index = user1.posts.indexOf(post);
      user1.posts[index].likes.add("asfasd");
    });
  }
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

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
                onTap: _goSettingPage,
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
                              'https://images.nightcafe.studio//assets/profile.png?tr=w-1600,c-at_max',
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
                                  user1.username,
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
                                      user1.posts.length.toString(),
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
                                    child: Text(user1.follower.length.toString(),
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
                                    child: Text(user1.following.length.toString(),
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
                                      onPressed: () {},
                                      child: Text(
                                        "Follow",
                                        style: loginTextStyle,

                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ]
                ),
                Column(
                  children: user1.posts.map((post) => PostCard(
                    post: post,
                    delete: (){
                      deletePost(post);
                    },
                    increment: (){
                      LikeIncrementer(post);
                    },
                  )).toList(),
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