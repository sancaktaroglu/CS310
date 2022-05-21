import 'package:flutter/material.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/dimen.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/feedPage.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);
  static const String routeName = "/notificaton";

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 229, 229),
      appBar: welcomeBar("Notifications"),
      body: ListView(
        children: <Widget>[
          Card(
              color: AppColors.headingColor,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "Aas liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza commented on your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza commented on your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "Aas liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "Aas liked your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
          Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: const NetworkImage(
                          'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: const Text(
                        "AhseniHamza commented on your post!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
              )),
        ],
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