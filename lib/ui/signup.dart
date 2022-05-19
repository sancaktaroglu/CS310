import 'dart:io' show Platform;

import 'package:flutter/material.dart';


import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
  static const String routeName = "/signup";
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  String name = "";
  String surname = "";
  String mail = "";
  String username = "";
  String password = "";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        centerTitle: true,
        title: Text("Hot Pins",
        style: HeadingTextStyle,),
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

      body: Center(
        child:
        Form(
          key:  _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

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
                        cursorColor: AppColors.inputColor,
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: InputBorder.none,

                        ),


                        validator: (value) {
                          if(value != null){
                            if(value.isEmpty) {
                              return 'Cannot leave name empty';
                            }

                          }
                        },
                        onSaved: (value) {
                          name = value ?? '';
                        },
                      ),
                    ),
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

                          hintText: "Surname",
                          border: InputBorder.none,

                        ),


                        validator: (value) {
                          if(value != null){
                            if(value.isEmpty) {
                              return 'Cannot leave surname empty';
                            }
                          }
                        },
                        onSaved: (value) {
                          surname = value ?? '';
                        },
                      ),
                    ),
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

                          hintText: "Email",
                          border: InputBorder.none,

                        ),


                        validator: (value) {
                          if(value != null){
                            if(value.isEmpty) {
                              return 'Cannot leave mail empty';
                            }

                          }
                        },
                        onSaved: (value) {
                          mail = value ?? '';
                        },
                      ),
                    ),
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
                          cursorColor: AppColors.textColor,
                          decoration: InputDecoration(
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
                      child: Text("Sign Up",
                        style: WelcomeButtonTextStyle,),
                    )


                ),
              ),


              SizedBox(height: 40),
            ],
          ),

        ),
      ),

    );
  }
}
