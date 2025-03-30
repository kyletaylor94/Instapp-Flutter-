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
          _buildDragHandle(),
          const SizedBox(height: 5),
          _buildTitle(),
          const Divider(),
          Expanded(
            child: _buildCommentList(),
          ),
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
      'Comments',
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCommentList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => _buildCommentItem(),
    );
  }

  Widget _buildCommentItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          const CircleAvatar(radius: 13, backgroundColor: Colors.black),
          const SizedBox(width: 10),
          _buildCommentContent(),
          _buildLikeButton(),
        ],
      ),
    );
  }

  Widget _buildCommentContent() {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('mockuser', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text('24ó', style: TextStyle(color: Colors.grey)),
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
    );
  }

  Widget _buildLikeButton() {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border, size: 20),
        ),
        const Text('4'),
      ],
    );
  }
}
