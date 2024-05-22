import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:master_bot/constants/app_color.dart';

class TestColors {
  const TestColors({
    required this.listColor,
  });
  final List<JoopColor> listColor;
}

class JoopColor {
  const JoopColor({
    required this.solor,
  });

  final Color solor;
}

List<TestColors> orusSurooColorIndex = [
  o1,
];

const o1 = TestColors(
  listColor: [
    JoopColor(solor: AppColor.tuuraColor),
    JoopColor(solor: AppColor.kataColor),
    JoopColor(solor: AppColor.kataColor),
    JoopColor(solor: AppColor.kataColor),
  ],
);
