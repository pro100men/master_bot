class Sozdor {
  const Sozdor({
    required this.tekst,
  });
  final String tekst;
}

List<Sozdor> orusSozdorIndex = [o1, o2, o3, o4];

const o1 = Sozdor(
  tekst: '   Соз\n слова',
);
const o2 = Sozdor(
  tekst: 'Ручка\n pan',
);
const o3 = Sozdor(
  tekst: 'Эшик\n Дверь',
);
const o4 = Sozdor(
  tekst: 'Эшиjh\n Двеkhрь',
);
List<Sozdor> anglisSozdorIndex = [a1, a2, a3];

const a1 = Sozdor(
  tekst: '   англисчеси эмне',
);

const a2 = Sozdor(
  tekst: '  англисчеси \n',
);

const a3 = Sozdor(
  tekst: '   англисчеси эмне',
);
