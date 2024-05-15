import 'package:flutter/material.dart';

class sliderWidget extends StatelessWidget {
  const sliderWidget({
    super.key,
    required this.value,
  });
  final double value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      child: SliderTheme(
        data: SliderThemeData(
          thumbShape: SliderComponentShape.noThumb,
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: value,
          max: 10,
          activeColor: Color(0xff1bc61b),
          inactiveColor: Color(0xff5c5f5c),
          onChanged: (double value) {},
        ),
      ),
    );
  }
}
