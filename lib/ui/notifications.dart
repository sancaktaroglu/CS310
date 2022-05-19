import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/size_config.dart';

class Body extends StatelessWidget {


  static const String routeName = "/notifications";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 229, 229),
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 231, 150, 29),
      ),
      body: ListView(
        children: <Widget>[
          Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLudBUAQNGPerdvGD3gHqObUr1mYm7lk383w&usqp=CAU'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://www.nicepng.com/png/detail/207-2078186_comment-free-icon-comment-free-download.png'),
                      width: SizeConfig.screenWidth * 0.06,
                      height: SizeConfig.screenHeight * 0.06,
                    ),
                    SizedBox(width: SizeConfig.screenWidth * 0.03),
                    Container(
                      width: SizeConfig.screenWidth * 0.8,
                      child: Text(
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
    );
  }
}
