import 'package:flutter/material.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/colors.dart';

class PostCard extends StatelessWidget {

  static const String routeName = "/postcard";

  final Post post;
  final VoidCallback delete;
  final VoidCallback increament;
  PostCard({required this.post, required this.delete, required this.increament });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(0, 16, 12, 8),

      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              post.text,
              style: ProfileNameTextStyle,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 120,
                  margin: EdgeInsets.all(8),
                  child: Image.network("https://mimarlikdukkani.com/wp-content/uploads/2018/09/starbucks_sabanc%C4%B1-25.jpg"),
                ), 

                const Spacer(),

                Column(
                  children: [
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: increament,
                          icon: Icon(
                            Icons.thumb_up,
                            size: 18,
                            color: Colors.orange,
                          ),
                          label: Text(
                              post.likes.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              )
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Icon(
                          Icons.comment,
                          size: 18,
                          color: Colors.orange,
                        ),

                        Text(
                            post.comments.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            )
                        ),

                        const SizedBox(width: 8),
                        IconButton(
                          iconSize: 18,
                          onPressed: delete,
                          icon: const Icon(Icons.pin_drop, size: 14, color: Colors.red),

                        ),
                      ],
                    ),
                    IconButton(
                      iconSize: 18,
                      onPressed: delete,
                      icon: const Icon(Icons.delete, size: 14, color: Colors.red,),
                    ),

                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
