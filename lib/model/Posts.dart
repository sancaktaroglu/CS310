

class Post {
  String text;
  String date;
  List <String> likes;
  List <String> dislikes;
  List <String> comments;
  String location;
  String picture;
  String topic;
  String userId;
  String postingTime;


  Post({
    required this.text,
    required this.date,
    required this.likes,
    required this.dislikes,
    required this.comments,
    required this.location,
    required this.picture,
    required this.topic,
    required this.userId,
    required this.postingTime,

  });
}

var title;
var caption;
var topic;
var location;
var cityPost;
var countryPost;
var streetPost;
var subAdministrativePost;