import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:master_bot/components/app_bar_widget.dart';
import 'package:master_bot/components/custom_buttom.dart';
import 'package:master_bot/components/slider.dart';

import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/sozduk_detals_model.dart';
import 'package:master_bot/models/suroo_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    Key? key,
    required this.suroo,
    required this.sozdor,
  }) : super(key: key);

  final List<Suroo> suroo;
  final List<Sozdor> sozdor;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  int index2 = 0;
  int tuuraJoop = 0;
  int katajoop = 0;

  Color testColor = AppColor.contColor;
  Color colorTest = AppColor.contColor;

  bool isPlaying = false;
  Timer? _timer;
  final player = AudioPlayer();
  Key customButtonKey = UniqueKey();

  // double valueSlider = 3600;

  void playerMetod() {
    final audioZapis = widget.sozdor[index2].zapis;
    player.play(AssetSource('player/$audioZapis'));
  }

  void timetest() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      setState(() {
        // index++;

        if (index < widget.suroo.length - 1) {
          index++;
        } else {
          index = 0;
          katajoop = 0;
          tuuraJoop = 0;
        }
        customButtonKey = UniqueKey();
      });
    });
  }

  void timesozdor() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer t) {
      playerMetod();
      setState(() {
        if (index2 < widget.sozdor.length - 1) {
          index2++;
        } else {
          index2 = 0;
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBaground,
      appBar: AppBar(
        backgroundColor: AppColor.scaffoldBaground,
        title: AppBarWidget(
          suroolordunSany: index,
          tuuraJoop: tuuraJoop,
          kataJoop: katajoop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: testColor,
              ),
              width: double.infinity,
              height: 137,
              child: Column(
                children: [
                  SliderWidget(value: index.toDouble()),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.suroo[index].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 5),
            CustomButton(
              key: customButtonKey,
              onTap: (isTrue) {
                setState(() {
                  if (isTrue) {
                    tuuraJoop++;
                  } else {
                    katajoop++;
                  }
                });
              },
              jooptor: widget.suroo[index].jooptor,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                SizedBox(
                  width: 85,
                  height: 50,
                  child: FloatingActionButton(
                    backgroundColor: AppColor.contColor,
                    child: const Text(
                      'Баштоо',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        if (index < widget.suroo.length - 1) {
                          index++;
                        } else {
                          index = 0;
                        }

                        customButtonKey = UniqueKey();
                      });
                      timetest();
                    },
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 85,
                  height: 50,
                  child: FloatingActionButton(
                    backgroundColor: AppColor.contColor,
                    child: const Text(
                      'Токтотуу',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      _timer?.cancel();
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Тестин жыйынтыгы'),
                            content: Text(
                              'Туура жообтор: $tuuraJoop\n'
                              'Ката жооптоп: $katajoop\n',
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: const Text('Кайра баштоо'),
                                onPressed: () {
                                  setState(() {
                                    index = 0;
                                    katajoop = 0;
                                    tuuraJoop = 0;
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 5),
            const Divider(color: Colors.black),
            const Divider(color: Colors.black),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.contColor),
              width: double.infinity,
              height: 250,
              child: Column(
                children: [
                  SliderWidget(value: index2.toDouble()),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Card(
                          color: AppColor.scaffoldBaground,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: Text(orusSozdorindex.length.toString(),
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700)),
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          height: 35,
                          child: FloatingActionButton(
                            backgroundColor: AppColor.scaffoldBaground,
                            onPressed: () {
                              timesozdor();
                              setState(() {
                                isPlaying = !isPlaying;
                              });
                            },
                            child: Icon(
                              (isPlaying == true)
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),
                        Card(
                          color: AppColor.scaffoldBaground,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 2),
                            child: Text('$index2',
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.sozdor[index2].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
