import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/current_user.dart';

abstract class SearchService {
  Future<List<CurrentUser>> fetchAllUsers();
  Future<List<CurrentUser>> searchForUsers(String query);
  Future<List<CurrentUser>> searchBetweenLikes(String query);
}

class SearchServiceImpl extends SearchService {
  @override
  Future<List<CurrentUser>> fetchAllUsers() async {
    return MockUsers.users;
  }

  @override
  Future<List<CurrentUser>> searchBetweenLikes(String query) async {
    throw UnimplementedError();
  }

  @override
  Future<List<CurrentUser>> searchForUsers(String query) async {
    throw UnimplementedError();
  }
}
