import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyGridBarang extends StatelessWidget {
  const MyGridBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 208,
      ),
      itemCount: 5,
      itemBuilder: ((context, index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.amber),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      Text('Product Name'),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Rp. 23.000'),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
