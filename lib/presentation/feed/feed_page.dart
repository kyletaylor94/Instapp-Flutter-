import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                );
              },
            ),
          ),

          // Divider between stories and feed
          const Divider(height: 1),

          // Feed - Vertical ListView
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'username',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        SizedBox(width: 10),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            SizedBox(width: 4),
                            Text('5'),
                          ],
                        ),
                        SizedBox(width: 20),
                        Row(
                          children: [
                            Icon(Icons.chat_bubble_outline),
                            SizedBox(width: 4),
                            Text('32'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              'username',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text('caption'),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              '4 órája',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
