import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/services/authentication.dart';
import 'package:untitled2/services/google_sign_in.dart';
import 'package:untitled2/ui/OnBoarding.dart';
import 'package:untitled2/ui/add_comment.dart';
//import 'package:untitled2/ui/post_card.dart';
import 'package:untitled2/ui/change_password.dart';
import 'package:untitled2/ui/choose_location.dart';
import 'package:untitled2/ui/create_post_photo.dart';
import 'package:untitled2/ui/create_post_text.dart';
import 'package:untitled2/ui/edit_post.dart';
import 'package:untitled2/ui/explore_screen.dart';
import 'package:untitled2/ui/feedPage.dart';
import 'package:untitled2/ui/login.dart';
import 'package:untitled2/ui/notifications.dart';
import 'package:untitled2/ui/profile.dart';
import 'package:untitled2/ui/profile_edit.dart';
import 'package:untitled2/ui/signup.dart';
import 'package:untitled2/ui/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;
  runApp(Annotation(showHome: showHome));
}
class Annotation extends StatelessWidget {
  final bool showHome;
  const Annotation({Key? key,
    required this.showHome,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider()

        ),
        StreamProvider<User?>.value(value: AuthService().user, initialData: null)],
      child: MaterialApp(
        routes: {
          '/welcome': (context) => const Welcome(),
          SignUp.routeName: (context) => const SignUp(),
          Login.routeName: (context) => const Login(),
          ProfileEdit.routeName: (context) => const ProfileEdit(),
          ChangePassword.routeName: (context) => const ChangePassword(),
          ExploreScreen.routeName: (context) => const ExploreScreen(),
          FeedPage.routeName: (context) => const FeedPage(),
          //PostCard.routeName: (context) => PostCard(),
          Profile.routeName: (context) => const Profile(),
          Notifications.routeName: (context) => const Notifications(),
          CreatePostText.routeName: (context) => const CreatePostText(),
          CreatePostLocation.routeName: (context) => const CreatePostLocation(),
          CreatePostPhoto.routeName: (context) => const CreatePostPhoto(),
          EditPost.routeName: (context) => const EditPost(),
          AddComment.routeName: (context) => const AddComment(),


        },
        home: showHome ? const Welcome() : const OnBoarding(),
      ),
    );
  }
  }






