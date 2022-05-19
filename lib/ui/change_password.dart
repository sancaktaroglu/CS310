import 'package:flutter/material.dart';

import 'package:cs310/util/colors.dart';
import 'package:cs310/util/styles.dart';

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  @override
  State<Change_Password> createState() => _Change_PasswordState();

  static const String routeName = "/changePassword";
}

class _Change_PasswordState extends State<Change_Password> {

  final _formKey = GlobalKey<FormState>();
  String oldPassword = "";
  String newPassword = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 10,
        title: Text("Change Password",
          style: HeadingTextStyle,),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[AppColors.primary, AppColors.secondary],
            ),
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
                              hintText: "Old Password",
                              border: InputBorder.none,
                            ),


                            validator: (value) {
                              if(value != null){
                                if(value.isEmpty) {
                                  return 'Cannot leave old password empty';
                                }
                              }
                            },

                            onSaved: (value){
                              oldPassword = value ?? '';
                            },
                          ),
                        )
                    )
                ),


                SizedBox(height: 20),


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
                            newPassword = value ?? '';
                          },
                        ),
                      ),
                    )
                ),


                SizedBox(height: 40),

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
                        child: Text("Change Password",
                          style: WelcomeButtonTextStyle,),
                      )


                  ),
                ),


                SizedBox(height: 40),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
