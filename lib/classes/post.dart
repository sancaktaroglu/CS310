import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/model/Posts.dart';
import 'package:untitled2/util/colors.dart';
import 'package:untitled2/util/styles.dart';
import 'package:untitled2/util/dimen.dart';

final CollectionReference postCollection = FirebaseFirestore.instance.collection("Posts");

final user = FirebaseAuth.instance.currentUser!;
Future<void> likePost(Post post) async {
  DocumentSnapshot snapshot = await postCollection.doc(post.postId).get();
  post.likes = List<String>.from(snapshot.get('likes'));
  if (post.likes.contains(user.uid)){
    post.likes.remove(user.uid);
    postCollection.doc(post.postId).update({
      'likes': post.likes,
    });
  }
  else{
    post.likes.add(user.uid);
    postCollection.doc(post.postId).update({
      'likes': post.likes,
    });
  }

  post.dislikes = List<String>.from(snapshot.get('dislikes'));
  if (post.dislikes.contains(user.uid)) {
    post.dislikes.remove(user.uid);
    postCollection.doc(post.postId).update({
      'dislikes': post.dislikes,
    });
  }
}
Future<void> dislikePost(Post post) async{
  DocumentSnapshot snapshot = await postCollection.doc(post.postId).get();
  post.dislikes = List<String>.from(snapshot.get('dislikes'));
  if (post.dislikes.contains(user.uid)){
    post.dislikes.remove(user.uid);
    postCollection.doc(post.postId).update({
      'dislikes': post.dislikes,
    });
  }
  else{
    post.dislikes.add(user.uid);
    postCollection.doc(post.postId).update({
      'dislikes': post.dislikes,
    });
  }

  post.likes = List<String>.from(snapshot.get('likes'));
  if (post.likes.contains(user.uid)) {
    post.likes.remove(user.uid);
    postCollection.doc(post.postId).update({
      'likes': post.likes,
    });
  }

}
Card card(Post post,String name, String surname, String date, String location, String comment, String link, Function func, BuildContext context) {
  SizeConfig().init(context);
  return Card(
    child: SizedBox(
      height: SizeConfig.screenHeight/2,
      child: Column(
        children: <Widget>[
          SizedBox(height: SizeConfig.blockSizeVertical*3),
          ListTile(
            leading: const CircleAvatar(
            ),
            title: Text("$name $surname"),
            subtitle: Text("$date \n$location"),
            trailing: const Icon(Icons.bookmark, color: AppColors.secondary),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              comment,
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(link),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.thumb_up, color: AppColors.secondary),
                    SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                    Text(
                      "Like",
                      style: cardTextStyle,
                    ),
                  ],
                ),
                onTap: (){likePost(post);},
              ),
              GestureDetector(
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.thumb_down, color: AppColors.secondary),
                    SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                    Text(
                      "Dislike",
                      style: cardTextStyle,
                    ),
                  ],
                ),
                onTap: (){dislikePost(post);},
              ),
              GestureDetector(
                child: Row(
                  children:  <Widget>[
                    const Icon(Icons.comment, color: AppColors.secondary),
                    SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                    Text(
                      "Comment",
                      style: cardTextStyle,
                    ),
                  ],
                ),
                onTap: (){func();},
              ),
              Row(
                children: <Widget>[
                  const Icon(Icons.share, color: AppColors.secondary),
                  SizedBox(width: SizeConfig.blockSizeHorizontal*2),
                  Text(
                    "Share",
                    style: cardTextStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeConfig.blockSizeVertical*4,),
        ],
      ),
    ),
  );
}
