import 'package:flutter/material.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/colors.dart';

class feedPage extends StatefulWidget {
  const feedPage({Key? key}) : super(key: key);
  static const String routeName = "/feedPage";

  @override
  State<feedPage> createState() => _feedPageState();
}

class _feedPageState extends State<feedPage> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _ONTAP(index) {
      setState(() {
        _selectedIndex = index;
        if(index == 0)
          {
            Navigator.pushNamedAndRemoveUntil(context, feedPage.routeName, (route) => false);
          }
        else if(index == 1)
        {
          Navigator.pushNamedAndRemoveUntil(context, exploreScreen.routeName, (route) => false);
        }
        else if(index == 2)
        {
          Navigator.pushNamedAndRemoveUntil(context, Profile_Edit.routeName, (route) => false);
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
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: Text("Hot Pins",
            style: HeadingTextStyle),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[AppColors.primary, AppColors.secondary]
              )
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right:20.0),
            child: GestureDetector(
                onTap: () => print("Sa"),
                child: Icon(
                  Icons.settings,
                  size: 27,
                )
            ),
          )
        ],
      ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  child: Container(
                    height: 350.0,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20.0),
                        ListTile(
                          leading: CircleAvatar(),
                          title: Text("Ali Yıldırım"),
                          subtitle: Text("Mon Nov 13 2022 17:32:10 \nMcDonald's Kadıköy"),
                          trailing: Icon(Icons.bookmark, color: Colors.grey),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              "I enjoyed the hamburger but since it was a very crowded restaurant, the timing was very bad and it was a bit cold.",
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://b.zmtcdn.com/data/pictures/0/5906110/69769ab70089bf3573fcb90c62703640.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.thumb_up, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Like", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.thumb_down, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Dislike", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.comment, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Comment", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
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
                        SizedBox(height: 20.0),
                        ListTile(
                          leading: CircleAvatar(),
                          title: Text("Ali Yıldırım"),
                          subtitle: Text("Mon Nov 13 2022 17:32:10 \nMcDonald's Kadıköy"),
                          trailing: Icon(Icons.bookmark, color: Colors.grey),
                        ),
                        SizedBox(height: 10.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Text(
                              "I enjoyed the hamburger but since it was a very crowded restaurant, the timing was very bad and it was a bit cold.",
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://b.zmtcdn.com/data/pictures/0/5906110/69769ab70089bf3573fcb90c62703640.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.thumb_up, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Like", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.thumb_down, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Dislike", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.comment, color: Colors.grey),
                                SizedBox(width: 10.0),
                                Text("Comment", style: TextStyle(color: Colors.grey),),
                              ],
                            ),
                            Row(
                              children: <Widget>[
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
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
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
            onTap: _ONTAP,
          ),

        );
  }
}