import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryExample extends StatefulWidget {
  const StoryExample({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _StoryExampleState createState() => _StoryExampleState();
}

class _StoryExampleState extends State<StoryExample> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            storyItems: [
              StoryItem.pageProviderImage(
                imageFit: BoxFit.cover,
                const AssetImage('assets/mockPhoto.jpg'),
              ),
              StoryItem.pageProviderImage(
                imageFit: BoxFit.cover,
                const AssetImage('assets/mockPhoto2.jpg'),
              ),
              StoryItem.pageImage(
                  url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
                  controller: storyController),
            ],
            onStoryShow: (storyItem, index) {
              print("Showing a story");
            },
            onComplete: () {
              print("Completed a cycle");
            },
            progressPosition: ProgressPosition.top,
            repeat: false,
            controller: storyController,
          ),
          const Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  'username',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
