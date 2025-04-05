import 'package:flutter/material.dart';
import 'package:insta_app_flutter/entity/profile_stat_model.dart';

class CurrentUser {
  final String id;
  final String username;
  final String fullName;
  final ProfileStatModel stat;
  final Image profileImage;

  CurrentUser(
    this.id,
    this.username,
    this.fullName,
    this.stat,
    this.profileImage,
  );
}
