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
    super.key,
    required this.suroo,
    required this.sozdor,
  });

  final List<Suroo> suroo;
  final List<Sozdor> sozdor;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // final _player = AudioPlayer();

  int index = 1;
  int yndex = 0;
  int tuuraJoop = 0;
  bool time = false;
  Color testColor = AppColor.contColor;

  int katajoop = 0;

  @override
  Widget build(BuildContext context) {
    // final time = Duration(seconds: 30);
// print("${_printDuration(time)}");
    return Scaffold(
      backgroundColor: AppColor.scaffoldBaground,
      appBar: AppBar(
        backgroundColor: AppColor.scaffoldBaground,
        title: AppBarWidget(
          suroolordunSany: yndex,
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
                  borderRadius: BorderRadius.circular(7), color: testColor),
              width: double.infinity,
              height: 137,
              child: Column(
                children: [
                  sliderWidget(value: yndex.toDouble()),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      widget.suroo[yndex].text,
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
              jooptor: widget.suroo[yndex].jooptor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 115,
                  height: 55,
                  child: FloatingActionButton(
                    backgroundColor: AppColor.contColor,
                    child: const Text('Кийинки'),
                    onPressed: () {
                      setState(() {
                        testColor = AppColor.contColor;
                      });
                      // Timer.periodic(Duration(seconds: 10), (Timer t) {
                      setState(() {
                        widget.suroo[yndex++];
                      });
                      if (yndex == widget.suroo.length) {
                        yndex = 0;
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
                                      yndex = 0;
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
                      }
                      // });
                    },
                  ),
                ),
                SizedBox(
                  width: 115,
                  height: 55,
                  child: FloatingActionButton(
                    backgroundColor: AppColor.contColor,
                    child: const Text('авто откозуу'),
                    onPressed: () {
                      Timer.periodic(Duration(seconds: 5), (Timer t) {
                        setState(() {
                          widget.suroo[yndex++];
                        });
                        if (yndex == widget.suroo.length) {
                          yndex--;

                          setState(() {
                            yndex = 0;
                            katajoop = 0;
                            tuuraJoop = 0;
                          });
                        }
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 115,
                  height: 55,
                  child: FloatingActionButton(
                    backgroundColor: AppColor.contColor,
                    child: const Text('Токтотуу'),
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
                                    yndex = 0;
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
              ],
            ),
            const SizedBox(height: 8),
            const Divider(color: Colors.black),
            const Divider(color: Colors.black),
            InkWell(
              // AudioPlayer().play(AssetSource('notes/do.mp3'));
              onTap: () {
                Timer.periodic(Duration(seconds: 5), (Timer t) {
                  AudioPlayer().play(
                      AssetSource('player/${widget.sozdor[index].zapis}'));
                  setState(() {
                    widget.sozdor[index++];
                    if (index == widget.sozdor.length) {
                      index = 1;
                    }
                  });
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Color.fromARGB(247, 149, 149, 157),
                ),
                width: double.infinity,
                height: 250,
                child: Column(
                  children: [
                    sliderWidget(value: index.toDouble()),
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
                                  style: const TextStyle(fontSize: 22)),
                            ),
                          ),
                          Card(
                            color: AppColor.scaffoldBaground,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                              child: Text('$index',
                                  style: const TextStyle(fontSize: 22)),
                            ),
                          ),
                          const Card(
                            color: AppColor.scaffoldBaground,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Icon(Icons.translate,
                                    color: Color.fromARGB(255, 7, 7, 0))),
                          ),
                          const Card(
                            color: AppColor.scaffoldBaground,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Icon(Icons.translate,
                                    color: Color.fromARGB(255, 7, 7, 0))),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        // print("${_printDuration(time)}");

                        widget.sozdor[index].tekst,
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
            ),
          ],
        ),
      ),
    );
  }
}
