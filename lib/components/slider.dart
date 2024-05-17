import 'package:flutter/material.dart';

class sliderWidget extends StatelessWidget {
  const sliderWidget({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        overlayShape: SliderComponentShape.noOverlay,
      ),
      child: Slider(
        value: value,
        max: 10,
        activeColor: Color(0xff1bc61b),
        inactiveColor: Color.fromARGB(255, 231, 144, 122),
        onChanged: (double value) {},
      ),
    );
  }
}
