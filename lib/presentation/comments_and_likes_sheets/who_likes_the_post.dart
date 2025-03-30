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
          _buildDragHandle(),
          const SizedBox(height: 5),
          _buildTitle(),
          const Divider(),
          const SizedBox(height: 10),
          _buildSearchField(),
          const SizedBox(height: 10),
          Expanded(child: _buildUserList()),
        ],
      ),
    );
  }

  Widget _buildDragHandle() {
    return Container(
      width: 40,
      height: 5,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(24)),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      'Likes',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSearchField() {
    return CupertinoSearchTextField(
      onChanged: (value) {
        setState(() => query = value.toLowerCase());
      },
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => _buildUserItem(users[index]),
    );
  }

  Widget _buildUserItem(String userName) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const CircleAvatar(radius: 20, backgroundColor: Colors.black),
          const SizedBox(width: 10),
          _buildUserInfo(userName),
          const Spacer(),
          _buildFollowButton(),
        ],
      ),
    );
  }

  Widget _buildUserInfo(String userName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const Text('real name', style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildFollowButton() {
    return Container(
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Follow',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
