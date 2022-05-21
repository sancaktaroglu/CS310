import 'package:flutter/material.dart';


class Post extends StatelessWidget {
  static const String name = "";
  static const String surname = "";
  static const String date = "";
  static const String location = "";
  static const String comment = "";
  static const String link = "";

  const Post({Key? key, required String name, required String surname, required String date, required String location, required String comment, required String link}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 350.0,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            const ListTile(
              leading: CircleAvatar(),
              title: Text("$name $surname"),
              subtitle: Text("$date $location"),
              trailing: Icon(Icons.bookmark, color: Colors.grey),
            ),
            const SizedBox(height: 10.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                comment,
              ),
            ),
            const SizedBox(height: 15.0),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(link),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Icon(Icons.thumb_up, color: Colors.grey),
                    SizedBox(width: 10.0),
                    Text("Like", style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.thumb_down, color: Colors.grey),
                    SizedBox(width: 10.0),
                    Text("Dislike", style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.comment, color: Colors.grey),
                    SizedBox(width: 10.0),
                    Text("Comment", style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Icon(Icons.share, color: Colors.grey),
                    SizedBox(width: 10.0),
                    Text("Share", style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}