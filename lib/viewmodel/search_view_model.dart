import 'package:insta_app_flutter/entity/current_user.dart';
import 'package:insta_app_flutter/usecases/search_usecase.dart';

class SearchViewModel {
  List<CurrentUser> _allUsers;
  final SearchUsecase _searchUsecase;

  SearchViewModel(
    this._allUsers,
    this._searchUsecase,
  );

  Future<void> fetchAllUsers() async {
    try {
      _allUsers = await _searchUsecase.fetchAllUsers();
    } catch (e) {
      print('Error! $e');
    }
  }

  Future<void> searchingBetweenUsers(String query) async {
    try {
      await _searchUsecase.searchBetweenUsers(query);
    } catch (e) {
      print('Error! $e');
    }
  }

  Future<void> searchBetweenLikes(String query) async {
    try {
      await _searchUsecase.searchBetweenLikes(query);
    } catch (e) {
      print('Error! $e');
    }
  }
}
