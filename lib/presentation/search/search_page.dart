import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';
  final List<String> users = List.generate(20, (index) => 'User $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CupertinoSearchTextField(
          onChanged: (value) {
            setState(() {
              query = value.toLowerCase();
            });
          },
        ),
      ),
      body: ListView.builder(
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
      ),
    );
  }
}
