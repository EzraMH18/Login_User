import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyRangeSlider extends StatelessWidget {
  MyRangeSlider({super.key});
  RangeValues values = RangeValues(10.000, 190.000);

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
          thumbColor: Color(0xFFFFA45B),
          activeTrackColor: Color(0xFFFFA45B),
          inactiveTrackColor: Colors.transparent),
      child: Column(
        children: [
          RangeSlider(
              values: values,
              min: 0,
              max: 200.000,
              divisions: 20,
              labels: RangeLabels(
                values.start.round().toString(),
                values.end.round().toString(),
              ),
              onChanged: (values) => this.values = values),
        ],
      ),
    );
  }
}
