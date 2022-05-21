import 'package:flutter/material.dart';
import 'package:untitled2/ui/feedPage.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/appBar.dart';
import 'package:untitled2/util/dimen.dart';

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
    SizeConfig().init(context);
    return Scaffold(
      appBar: welcomeBar("Hot Pins"),

      body: SafeArea(
        child: Center(
          child:
          Form(
            key:  _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Image.network("https://mpng.subpng.com/20190726/pxq/kisspng-location-google-maps-google-map-maker-google-my-ma-mapas-digitales-ahorran-22-pesos-al-ao-a-los-5d3bbd59d01267.4845642715641961858523.jpg"),

                SizedBox(height: SizeConfig.screenHeight/20,),


                Container(
                    height: SizeConfig.screenHeight/15,
                    margin: const EdgeInsets.symmetric(horizontal: 43),

                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                          color: AppColors.inputColor,
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            cursorColor: AppColors.textColor,
                            decoration: const InputDecoration(
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


                SizedBox(height: SizeConfig.blockSizeHorizontal*4),


                Container(
                    height: SizeConfig.screenHeight/15,
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


                SizedBox(height: SizeConfig.blockSizeHorizontal*6),

                Container(
                  height: SizeConfig.screenHeight/15,
                  margin: const EdgeInsets.symmetric(horizontal: 43),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: FlatButton(
                        color: AppColors.buttonColor,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, FeedPage.routeName, (route) => false);

                          /*if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            //database check
                          }*/

                        },
                        child: Text("Login",
                          style: welcomeButtonTextStyle,),
                      )


                  ),
                ),


                SizedBox(height: SizeConfig.screenHeight/20),
              ],
            ),

          ),
        ),

      )

    );
  }
}

