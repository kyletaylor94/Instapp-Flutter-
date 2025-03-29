import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _openPhotoView(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => Stack(
        children: [
          Container(color: Colors.black),
          PhotoViewGallery.builder(
            itemCount: 12,
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: const AssetImage("assets/mockPhoto.jpg"),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(color: Colors.black),
            pageController: PageController(initialPage: index),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const Row(
            children: [
              SizedBox(width: 30),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                  ),
                  Text('user'),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '5',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('posts'),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '10',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Followers'),
                ],
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '15',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Following'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: MediaQuery.of(context).size.width - 32,
            height: 30,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Center(
              child: Text('Edit profile'),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
              padding: const EdgeInsets.all(8),
              children: List.generate(
                12,
                (index) {
                  return GestureDetector(
                    onTap: () => _openPhotoView(context, index),
                    child: Image.asset(
                      'assets/mockPhoto.jpg',
                      width: 140,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
