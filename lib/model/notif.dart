import 'package:flutter/material.dart';

class Notif {
  String userId;
  String otherUserId;
  int notifType;
  String postId;

  Notif(
      {required this.userId,
      required this.otherUserId,
      required this.notifType,
      required this.postId});
}
