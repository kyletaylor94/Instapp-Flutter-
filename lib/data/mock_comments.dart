import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/comments_model.dart';
import 'package:uuid/uuid.dart';

class MockComments {
  static final List<CommentsModel> comments = [
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[0],
      'Great post! Love the composition and colors.',
      12,
      DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[1],
      'This is amazing! Where was this taken?',
      8,
      DateTime.now().subtract(const Duration(minutes: 15)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[2],
      'Beautiful shot! The lighting is perfect.',
      15,
      DateTime.now().subtract(const Duration(minutes: 30)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[3],
      'Love your work! Keep it up!',
      6,
      DateTime.now().subtract(const Duration(hours: 1)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[4],
      'This is so inspiring! Thank you for sharing.',
      9,
      DateTime.now().subtract(const Duration(hours: 2)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[5],
      'The details in this photo are incredible!',
      11,
      DateTime.now().subtract(const Duration(hours: 3)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[6],
      'What camera did you use for this shot?',
      4,
      DateTime.now().subtract(const Duration(hours: 4)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[7],
      'This is my favorite photo of yours so far!',
      7,
      DateTime.now().subtract(const Duration(hours: 5)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[8],
      'The composition is perfect, great job!',
      13,
      DateTime.now().subtract(const Duration(hours: 6)),
    ),
    CommentsModel(
      const Uuid().v4(),
      MockUsers.users[9],
      'This deserves more likes! Amazing work!',
      10,
      DateTime.now().subtract(const Duration(hours: 7)),
    ),
  ];
}
