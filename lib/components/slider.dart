import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
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
        max: 4,
        activeColor: const Color(0xff1bc61b),
        inactiveColor: const Color.fromARGB(255, 231, 144, 122),
        onChanged: (double value) {},
      ),
    );
  }
}
