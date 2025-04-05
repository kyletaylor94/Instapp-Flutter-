import 'package:flutter/material.dart';
import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/entity/profile_stat_model.dart';
import 'package:uuid/uuid.dart';

class MockUsers {
  static final List<CurrentUser> users = [
    CurrentUser(
      const Uuid().v4(),
      'john_doe',
      'John Doe',
      ProfileStatModel(42, 1234, 567),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'jane_smith',
      'Jane Smith',
      ProfileStatModel(28, 892, 445),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'mike_wilson',
      'Mike Wilson',
      ProfileStatModel(156, 3421, 890),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'sarah_jones',
      'Sarah Jones',
      ProfileStatModel(67, 1567, 234),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'alex_brown',
      'Alex Brown',
      ProfileStatModel(89, 2345, 678),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'emma_davis',
      'Emma Davis',
      ProfileStatModel(112, 3456, 789),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'david_miller',
      'David Miller',
      ProfileStatModel(45, 987, 432),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'lisa_taylor',
      'Lisa Taylor',
      ProfileStatModel(78, 2345, 567),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'tom_anderson',
      'Tom Anderson',
      ProfileStatModel(34, 567, 234),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
    CurrentUser(
      const Uuid().v4(),
      'amy_wright',
      'Amy Wright',
      ProfileStatModel(92, 1789, 456),
      Image.asset('assets/mockPhoto.jpg', width: 40, height: 40),
    ),
  ];
}
