import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/services/search_service.dart';

abstract class SearchRepository {
  Future<List<CurrentUser>> getAllUsers();
  Future<List<CurrentUser>> searchForUsers(String query);
  Future<List<CurrentUser>> searchBetweenlikes(String query);
}

class SearchRepositoryImpl extends SearchRepository {
  final SearchService _searchService;

  SearchRepositoryImpl(this._searchService);

  @override
  Future<List<CurrentUser>> getAllUsers() async {
    return await _searchService.fetchAllUsers();
  }

  @override
  Future<List<CurrentUser>> searchBetweenlikes(String query) async {
    return await _searchService.searchBetweenLikes(query);
  }

  @override
  Future<List<CurrentUser>> searchForUsers(String query) async {
    return await _searchService.searchForUsers(query);
  }
}
