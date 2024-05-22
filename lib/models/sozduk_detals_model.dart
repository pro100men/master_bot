import 'package:flutter/material.dart';

class Sozdor {
  const Sozdor({
    required this.tekst,
    required this.zapis,
  });
  final String tekst;
  final String zapis;
}

List<Sozdor> orusSozdorindex = [o1, o2, o3, o4, o5, o6, o7];

const o1 = Sozdor(
  tekst: '   Соз\n слова',
  zapis: 'rec2.wav',
);
const o2 = Sozdor(
  tekst: 'Ручка\n pan',
  zapis: 'rec.wav',
);
const o3 = Sozdor(
  tekst: 'Эшик\n Дверь',
  zapis: 'rec1.wav',
);
const o4 = Sozdor(
  tekst: 'Эшиjh\n Двеkhрь',
  zapis: 'rec2.wav',
);
const o5 = Sozdor(
  tekst: 'Эшиjh\n Двеkhрь',
  zapis: 'rec2.wav',
);
const o6 = Sozdor(
  tekst: 'Эшиjh\n Двеkhрь',
  zapis: 'rec1.wav',
);
const o7 = Sozdor(
  tekst: 'Эшиjh\n Двеkhрь',
  zapis: 'rec1.wav',
);
List<Sozdor> anglisSozdorYndex = [
  a1,
  a2,
  a3,
];

const a1 = Sozdor(
  tekst: '   англисчеси эмне',
  zapis: 're.mp3',
);

const a2 = Sozdor(
  tekst: '  англисчеси \n',
  zapis: 'do.mp3',
);

const a3 = Sozdor(
  tekst: '   англисчеси эмне',
  zapis: 'do2.mp3',
);
