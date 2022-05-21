import 'package:flutter/material.dart';
import 'package:untitled2/ui/notifications.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/util/appBar.dart';
import 'explore_screen.dart';




class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);
  static const String routeName = "/feedPage";

  @override
  State<FeedPage> createState() => _FeedPageState();
}




class _FeedPageState extends State<FeedPage> {
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

    return  Scaffold(
      appBar: pageBar(context, Notifications.routeName),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  child: SizedBox(
                    height: 350.0,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        const ListTile(
                          leading: CircleAvatar(),
                          title: Text("Ali Yıldırım"),
                          subtitle: Text("Mon Nov 13 2022 17:32:10 \nMcDonald's Kadıköy"),
                          trailing: Icon(Icons.bookmark, color: Colors.grey),
                        ),
                        const SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Text(
                              "I enjoyed the hamburger but since it was a very crowded restaurant, the timing was very bad and it was a bit cold.",
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://b.zmtcdn.com/data/pictures/0/5906110/69769ab70089bf3573fcb90c62703640.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: const <Widget>[
                                Icon(Icons.thumb_up, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Like", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(Icons.thumb_down, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Dislike", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(Icons.comment, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Comment", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(Icons.share, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Share", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 350.0,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        const ListTile(
                          leading: CircleAvatar(),
                          title: Text("Ali Yıldırım"),
                          subtitle: Text("Mon Nov 13 2022 17:32:10 \nMcDonald's Kadıköy"),
                          trailing: Icon(Icons.bookmark, color: Colors.grey),
                        ),
                        const SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: const Text(
                              "I enjoyed the hamburger but since it was a very crowded restaurant, the timing was very bad and it was a bit cold.",
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://b.zmtcdn.com/data/pictures/0/5906110/69769ab70089bf3573fcb90c62703640.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: const <Widget>[
                                Icon(Icons.thumb_up, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Like", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(Icons.thumb_down, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Dislike", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(Icons.comment, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Comment", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: const <Widget>[
                                Icon(Icons.share, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Share", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
              ],
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