import 'package:flutter/material.dart';
import 'package:insta_app_flutter/entity/comments_model.dart';
import 'package:insta_app_flutter/entity/current_user.dart';

class PostModel {
  final String id;
  final List<CommentsModel> comments;
  final int commentsCount;
  final String caption;
  final Image postImage;
  final CurrentUser postByUser;

  PostModel(
    this.id,
    this.comments,
    this.commentsCount,
    this.caption,
    this.postImage,
    this.postByUser,
  );
}
