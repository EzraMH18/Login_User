import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:register_login/screens/home/admin/component/my_carousel.dart';
import 'package:register_login/screens/home/admin/component/my_search_field.dart';

import 'component/my_grid.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, admin !',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MySearchField(
                    'Search',
                    hint: 'Search your product here',
                    isFilled: true,
                    preffixIcon: Icon(Icons.search),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Promo Sambutan Tahun Baru',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyCarousel(),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Statistik Penjualan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MyGrid(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
