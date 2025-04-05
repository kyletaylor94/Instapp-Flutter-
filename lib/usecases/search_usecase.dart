import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/repository/search_repository.dart';

abstract class SearchUsecase {
  Future<List<CurrentUser>> fetchAllUsers();
  Future<List<CurrentUser>> searchBetweenUsers(String query);
  Future<List<CurrentUser>> searchBetweenLikes(String query);
}

class SearchUsecaseImpl extends SearchUsecase {
  final SearchRepository _repository;
  SearchUsecaseImpl(this._repository);

  @override
  Future<List<CurrentUser>> fetchAllUsers() async {
    return await _repository.getAllUsers();
  }

  @override
  Future<List<CurrentUser>> searchBetweenLikes(String query) async {
    return await _repository.searchBetweenlikes(query);
  }

  @override
  Future<List<CurrentUser>> searchBetweenUsers(String query) async {
    return await _repository.searchForUsers(query);
  }
}
