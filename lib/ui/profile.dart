import 'package:flutter/material.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
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

  User user1  = User(follower: 120, username: "Sarp Sarginoglu", following: 100, posts: 10, );
  List<Post> posts = [
    Post(text: 'Starbucks', date: 'January 20', likes: 3242, comments: 0),
    Post(text: 'Macfit', date: 'February 22', likes: 23534, comments: 200),
    Post(text: 'Cemal Usta', date: 'June 11', likes: 2313, comments: 12),
    Post(text: 'Fasshane', date: 'March 32', likes: 1231, comments: 10),
  ];
  void deletePost(Post post) {
    setState(() {
      posts.remove(post);
    });
  }

  void LikeIncrementer(Post post){
    setState(() {
      post.likes++;
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
          //Navigator.pushNamedAndRemoveUntil(context, ProfileEdit.routeName, (route) => false);
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
            padding: const EdgeInsets.only(right:20.0),
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
            padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 15, 30, 0),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60,
                          child: ClipOval(
                            child: Image.network(
                              'https://images.nightcafe.studio//assets/profile.png?tr=w-1600,c-at_max',
                              fit: BoxFit.fill,
                              width: 150,
                            ),
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 10, 0),
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

                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                                    child: Text(
                                      "300",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text('Posts',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                                    child: Text('900',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),),
                                  ),
                                  Text('Follower',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),)
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                                    child: Text('650',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                      ),),
                                  ),
                                  Text('Following',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),)
                                ],
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Container(
                                  height: 40,
                                  width: 200,
                                  margin: const EdgeInsets.only(top:20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: FlatButton(
                                      color: Colors.orange[400],
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
                  children: posts.map((post) => PostCard(
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
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.orange,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop),
            label: 'Map',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Camera',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.orange,

          ),
        ],
        onTap: onTap,
      )

    );


  }
}