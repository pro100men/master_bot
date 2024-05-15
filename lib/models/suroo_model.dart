import 'package:flutter/material.dart';
import 'package:master_bot/constants/app_color.dart';

class Suroo {
  const Suroo({
    required this.text,
    required this.jooptor,
  });
  final String text;

  final List<Joop> jooptor;
}

class Joop {
  const Joop({
    required this.color,
    required this.text,
    this.isTrue = false,
  });
  final Color color;
  final String text;
  final bool isTrue;
}

List<Suroo> orusSurooIndex = [o1, o2];

const o1 = Suroo(
  text: 'Сөздүк сөзүнүн орусчасы \n',
  jooptor: [
    Joop(text: 'Словарь', color: Colors.green, isTrue: true),
    Joop(text: 'Создук', color: AppColor.kataColor),
    Joop(text: 'Слава', color: AppColor.kataColor),
    Joop(text: 'Руский', color: AppColor.kataColor),
  ],
);

const o2 = Suroo(
  text: 'Бара жатам сөзүнүн орусчасы эмне',
  jooptor: [
    Joop(text: '', color: AppColor.kataColor),
    Joop(text: 'Япщния', color: AppColor.kataColor),
    Joop(text: 'Туркменистан', color: Colors.green, isTrue: true),
    Joop(text: 'Афганистан', color: AppColor.kataColor),
  ],
);
List<Suroo> anglisSurooIndex = [a1, a2];

const a1 = Suroo(
  text: 'Сөздүк сөзүнүн англисчеси \n',
  jooptor: [
    Joop(text: 'Kyrgyzstan', color: Colors.green, isTrue: true),
    Joop(text: 'Chaina', color: AppColor.kataColor),
    Joop(text: 'Russia', color: AppColor.kataColor),
    Joop(text: 'Kazakstan', color: AppColor.kataColor),
  ],
);

const a2 = Suroo(
  text: 'Бара жатам сөзүнүн англисчеси эмне',
  jooptor: [
    Joop(text: 'Карея', color: AppColor.kataColor),
    Joop(text: 'Япщния', color: AppColor.kataColor),
    Joop(text: 'Туркменистан', color: Colors.green, isTrue: true),
    Joop(text: 'Афганистан', color: AppColor.kataColor),
  ],
);
