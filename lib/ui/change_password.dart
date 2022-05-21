import 'package:flutter/material.dart';

import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/appBar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();

  static const String routeName = "/changePassword";
}

class _ChangePasswordState extends State<ChangePassword> {

  final _formKey = GlobalKey<FormState>();
  String oldPassword = "";
  String newPassword = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: welcomeBar("Settings"),
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
                    margin: const EdgeInsets.symmetric(horizontal: 43),

                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          color: AppColors.inputColor,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: AppColors.textColor,
                            decoration: const InputDecoration(
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


                const SizedBox(height: 20),


                Container(
                    height: 55,
                    margin: const EdgeInsets.symmetric(horizontal: 43),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Container(
                        color: AppColors.inputColor,
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          obscureText: true,
                          cursorColor: AppColors.textColor,
                          decoration: const InputDecoration(
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


                const SizedBox(height: 40),

                Container(
                  height: 55,
                  margin: const EdgeInsets.symmetric(horizontal: 43),
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
                          style: welcomeButtonTextStyle,),
                      )


                  ),
                ),


                const SizedBox(height: 40),
              ],
            ),

          ),
        ),

      ),
      bottomNavigationBar: BottomNavigationBar(

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
        //onTap: ONTAP,
      ),
    );
  }
}
