import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyCarousel extends StatelessWidget {
  const MyCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    final List _banner = [
      'banner 1',
      'banner 2',
      'banner 3',
      'banner 4',
      'banner 5',
    ];
    return CarouselSlider(
      options: CarouselOptions(height: 120.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber),
                child: Center(
                  child: Text(
                    'Image $i',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
