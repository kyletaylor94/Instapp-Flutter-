import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView.builder(
      itemBuilder: (context, index) {
        return const ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
              ),
              SizedBox(width: 10),
              Text(
                'mock user',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
