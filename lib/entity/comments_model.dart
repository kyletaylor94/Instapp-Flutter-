import 'package:insta_app_flutter/entity/current_user.dart';

class CommentsModel {
  final String id;
  final CurrentUser currentUser;
  final String commentText;
  final int likesCount;
  final DateTime timestamp;

  CommentsModel(
    this.id,
    this.currentUser,
    this.commentText,
    this.likesCount,
    this.timestamp,
  );
}
