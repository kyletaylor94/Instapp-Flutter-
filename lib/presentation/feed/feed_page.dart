import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:insta_app_flutter/presentation/comments_and_likes_sheets/comment_page_sheet.dart';
import 'package:insta_app_flutter/presentation/comments_and_likes_sheets/who_likes_the_post.dart';
import 'package:insta_app_flutter/presentation/stories/story_example.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildStoryList(),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => _buildPostItem(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoryList() {
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const StoryPage(),
                    ),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.yellow, Colors.pink, Colors.purple],
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: const CircleAvatar(
                      radius: 26, backgroundColor: Colors.black),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Your story',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPostItem(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        _buildPostHeader(),
        const SizedBox(height: 10),
        _buildPostImage(context),
        const SizedBox(height: 10),
        _buildPostActions(context),
        const SizedBox(height: 10),
        _buildLikeSection(context),
        const SizedBox(height: 3),
        _buildCaption(),
        _buildPostTime(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPostHeader() {
    return const Row(
      children: [
        SizedBox(width: 10),
        CircleAvatar(backgroundColor: Colors.black),
        SizedBox(width: 10),
        Text('username', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildPostImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      color: Colors.black,
    );
  }

  Widget _buildPostActions(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        const Row(
            children: [Icon(Icons.favorite), SizedBox(width: 4), Text('5')]),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => _showCommentSheet(context),
          child: const Row(children: [
            Icon(Icons.chat_bubble_outline),
            SizedBox(width: 4),
            Text('32')
          ]),
        ),
      ],
    );
  }

  void _showCommentSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => const CommentPageSheet(),
    );
  }

  Widget _buildLikeSection(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.black),
            children: [
              const TextSpan(
                  text: 'kyle ', style: TextStyle(fontWeight: FontWeight.bold)),
              const TextSpan(text: 'and '),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => _showLikesSheet(context),
                text: 'other people ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: 'likes this'),
            ],
          ),
        ),
      ],
    );
  }

  void _showLikesSheet(BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => const WhoLikesThePost(),
    );
  }

  Widget _buildCaption() {
    return const Row(
      children: [
        SizedBox(width: 10),
        Text('username', style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Text('caption'),
      ],
    );
  }

  Widget _buildPostTime() {
    return const Row(
      children: [
        SizedBox(width: 10),
        Text('4 órája', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
