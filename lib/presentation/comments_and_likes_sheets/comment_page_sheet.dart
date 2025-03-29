import 'package:flutter/material.dart';

class CommentPageSheet extends StatelessWidget {
  const CommentPageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
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
            'Comments',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      const CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'mockuser',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '24ó',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              'mock comment mock comment comment mock mock comment comment mock comment comment mock, asdasd mock,',
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              size: 20,
                            ),
                          ),
                          const Text('4')
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
