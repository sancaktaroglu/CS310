import 'Posts.dart';
import 'notif.dart';

class User {
  List <String> follower;
  List <String> following;
  List <Post> posts;
  String userId;
  String username;
  String email;
  bool private;
  String password;
  String fullName;
  String bio;
  List <Post> bookmark;
  List <Notif> notifications;



  User({
    required this.follower,
    required this.following,
    required this.posts,
    required this.userId,
    required this.username,
    required this.email,
    required this.private,
    required this.password,
    required this.fullName,
    required this.bio,
    required this.bookmark,
    required this.notifications
  });
}