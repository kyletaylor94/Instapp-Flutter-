import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhoLikesThePost extends StatefulWidget {
  const WhoLikesThePost({super.key});

  @override
  State<WhoLikesThePost> createState() => _WhoLikesThePostState();
}

class _WhoLikesThePostState extends State<WhoLikesThePost> {
  String query = '';
  final List<String> users = List.generate(20, (index) => 'User $index');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Likes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          CupertinoSearchTextField(
            onChanged: (value) {
              setState(() {
                query = value.toLowerCase();
              });
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        children: [
                          Text('mockuser'),
                          Text('real name'),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
