import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  final List<String> users = List.generate(20, (index) => 'User $index');
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: _searchTextField(),
      ),
      body: _createUserList(),
    );
  }

  Widget _searchTextField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      onChanged: (value) {
        setState(
          () {
            query = value.toLowerCase();
          },
        );
      },
    );
  }

  Widget _createUserList() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        if (query.isNotEmpty && !users[index].toLowerCase().contains(query)) {
          return const SizedBox.shrink();
        }
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,
          ),
          title: Text(
            users[index],
            style: const TextStyle(fontSize: 16),
          ),
        );
      },
    );
  }
}
