import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:register_login/screens/home/admin/component/my_dropdown.dart';
import 'package:register_login/screens/home/admin/component/my_grid_barang.dart';
import 'package:register_login/screens/home/admin/component/my_range_slider.dart';
import 'package:register_login/widgets/my_button.dart';

class AdminProduk extends StatefulWidget {
  const AdminProduk({super.key});

  @override
  State<AdminProduk> createState() => _AdminProdukState();
}

class _AdminProdukState extends State<AdminProduk> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, admin !',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.search),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    MyButton(
                      'All',
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    MyButton(
                      'Meal',
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    MyButton(
                      'Snack',
                      onClick: () {},
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    MyButton(
                      'Beverage',
                      onClick: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: MyDropdown(),
                    ),
                    MyRangeSlider(),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                MyGridBarang(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
