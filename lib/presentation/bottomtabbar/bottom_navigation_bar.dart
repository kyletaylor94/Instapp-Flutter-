import 'package:flutter/material.dart';
import 'package:insta_app_flutter/presentation/auth/pages/login_page.dart';
import 'package:insta_app_flutter/presentation/feed/feed_page.dart';
import 'package:insta_app_flutter/presentation/notifications/notifications_page.dart';
import 'package:insta_app_flutter/presentation/profile/profile_page.dart';
import 'package:insta_app_flutter/presentation/search/search_page.dart';
import 'package:insta_app_flutter/presentation/upload/upload_page.dart';
import 'package:insta_app_flutter/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    SearchPage(),
    UploadPage(),
    NotificationsPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Future<void> logout() async {
    final authViewModel = Provider.of<AuthViewModel>(context, listen: false);

    await authViewModel.signOut();

    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              print('logout button tapped!');
              await logout();
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
