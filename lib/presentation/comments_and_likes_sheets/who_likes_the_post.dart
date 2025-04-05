import 'package:flutter/material.dart';
import 'package:insta_app_flutter/data/mock_users.dart';
import 'package:insta_app_flutter/entity/current_user.dart';

class WhoLikesThePost extends StatefulWidget {
  const WhoLikesThePost({super.key});

  @override
  State<WhoLikesThePost> createState() => _WhoLikesThePostState();
}

class _WhoLikesThePostState extends State<WhoLikesThePost> {
  String query = '';
  final List<CurrentUser> users = MockUsers.users;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

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
          _searchTextField(),
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
        setState(() {
          query = value.toLowerCase();
        });
      },
    );
  }

  Widget _buildUserList() {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        if (query.isNotEmpty && 
            !user.username.toLowerCase().contains(query) && 
            !user.fullName.toLowerCase().contains(query)) {
          return const SizedBox.shrink();
        }
        return _buildUserItem(user);
      },
    );
  }

  Widget _buildUserItem(CurrentUser user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: user.profileImage.image,
          ),
          const SizedBox(width: 10),
          _buildUserInfo(user),
          const Spacer(),
          _buildFollowButton(),
        ],
      ),
    );
  }

  Widget _buildUserInfo(CurrentUser user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.username, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(user.fullName, style: const TextStyle(color: Colors.grey)),
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
