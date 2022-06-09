import 'package:flutter/material.dart';

class Notif {
  String userId;
  String otherUserId;
  String notifType;
  String postId;
  String doc_id;

  Notif(
      {required this.userId,
      required this.otherUserId,
      required this.notifType,
      required this.postId,
      required this.doc_id});
}
