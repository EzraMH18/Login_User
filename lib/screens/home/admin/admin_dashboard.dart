import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:register_login/screens/home/admin/admin_home.dart';
import 'package:register_login/screens/home/admin/admin_produk.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            AdminHome(),
            AdminProduk(),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('Beranda'),
            icon: Icon(Icons.home),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
          BottomNavyBarItem(
            title: Text('Produk'),
            icon: Icon(Icons.poll_rounded),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
          BottomNavyBarItem(
            title: Text('Wishlist'),
            icon: Icon(Icons.favorite),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
          BottomNavyBarItem(
            title: Text('Account'),
            icon: Icon(Icons.person),
            inactiveColor: Colors.black87,
            activeColor: Color(0xffFFA45B),
          ),
        ],
      ),
    );
  }
}
