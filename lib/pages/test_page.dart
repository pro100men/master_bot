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
  // double valueSlider = 3600;

  playerMetod() {
    final player = AudioPlayer();
    final audioZapis = widget.sozdor[index2].zapis;
    player.play(AssetSource('player/$audioZapis'));
  }

  void timetest() {
    Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        widget.suroo[index++];
      });
      if (index == widget.suroo.length) {
        index--;

        setState(() {
          index = 0;
          katajoop = 0;
          tuuraJoop = 0;
        });
      }
    });
  }

  void timesozdor() {
    //  final timeTesst =
    Timer.periodic(const Duration(seconds: 4), (Timer t) {
      playerMetod();
      setState(() {
        widget.sozdor[index2++];
        if (index == widget.sozdor.length) {
          index2--;
          setState(() {
            index2 = 0;
          });
        }
      });
    });
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
                  sliderWidget(value: index.toDouble()),
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
              onTap: (isTrue) {
                if (isTrue == true) {
                  tuuraJoop++;
                  setState(() {
                    testColor = AppColor.tuuraColor;
                  });
                } else {
                  setState(() {
                    testColor = AppColor.kataColor;
                  });
                  katajoop++;
                }
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
                        widget.suroo[index++];
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
                  sliderWidget(value: index2.toDouble()),
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
