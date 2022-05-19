import 'dart:io' show Platform;

import 'package:flutter/material.dart';


import 'package:cs310/util/colors.dart';
import 'package:cs310/util/styles.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();

  static const String routeName = "/login";
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),

      body: SafeArea(
        child: Center(
          child:
          Form(
            key:  _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Container(
                    child: Image.network("https://mpng.subpng.com/20190726/pxq/kisspng-location-google-maps-google-map-maker-google-my-ma-mapas-digitales-ahorran-22-pesos-al-ao-a-los-5d3bbd59d01267.4845642715641961858523.jpg")
                ),

                SizedBox(height: 20,),


                Container(
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 43),

                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          color: AppColors.inputColor,
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: AppColors.textColor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: AppColors.textColor,
                              ),
                              hintText: "Username",
                              border: InputBorder.none,
                            ),


                            validator: (value) {
                              if(value != null){
                                if(value.isEmpty) {
                                  return 'Cannot leave username empty';
                                }
                              }
                            },
                            onSaved: (value){
                              username = value ?? '';
                            },
                          ),
                        )
                    )
                ),


                SizedBox(height: 30),


                Container(
                    height: 55,
                    margin: EdgeInsets.symmetric(horizontal: 43),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Container(
                        color: AppColors.inputColor,
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          cursorColor: AppColors.textColor,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: AppColors.textColor,
                            ),
                            hintText: "Password",
                            border: InputBorder.none,

                          ),


                          validator: (value) {
                            if(value != null){
                              if(value.isEmpty) {
                                return 'Cannot leave password empty';
                              }
                              if(value.length < 6) {
                                return 'Password too short';
                              }
                            }
                          },
                          onSaved: (value) {
                            password = value ?? '';
                          },
                        ),
                      ),
                    )
                ),


                SizedBox(height: 20),

                Container(
                  height: 55,
                  margin: EdgeInsets.symmetric(horizontal: 43),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: FlatButton(
                        color: AppColors.buttonColor,
                        onPressed: () {
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            //database check
                          }

                        },
                        child: Text("Login",
                          style: WelcomeButtonTextStyle,),
                      )


                  ),
                ),


                SizedBox(height: 40),
              ],
            ),

          ),
        ),
      )
    );
  }
}


