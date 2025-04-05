import 'package:flutter/material.dart';
import 'package:insta_app_flutter/data/mock_comments.dart';
import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/post_model.dart';
import 'package:uuid/uuid.dart';

class MockPosts {
  static final List<PostModel> posts = [
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[0], MockComments.comments[1]],
      2,
      'Beautiful sunset at the beach! #nature #photography',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[0],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[2], MockComments.comments[3]],
      2,
      'New camera, new adventures! #photography #travel',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[1],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[4], MockComments.comments[5]],
      2,
      'City lights at night. #urban #photography',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[2],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[6], MockComments.comments[7]],
      2,
      'Mountain hiking with friends! #adventure #nature',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[3],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[8], MockComments.comments[9]],
      2,
      'Coffee and creativity. #coffee #morning',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[4],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[0], MockComments.comments[1]],
      2,
      'Street photography in the city. #street #photography',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[5],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[2], MockComments.comments[3]],
      2,
      'Portrait session with @jane_smith. #portrait #photography',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[6],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[4], MockComments.comments[5]],
      2,
      'Food photography for my new project. #food #photography',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[7],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[6], MockComments.comments[7]],
      2,
      'Architecture in the city. #architecture #urban',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[8],
    ),
    PostModel(
      const Uuid().v4(),
      [MockComments.comments[8], MockComments.comments[9]],
      2,
      'Nature\'s beauty captured. #nature #photography',
      Image.asset('assets/mockPhoto.jpg', width: 400, height: 400),
      MockUsers.users[9],
    ),
  ];
}
