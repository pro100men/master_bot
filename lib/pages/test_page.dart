import 'package:flutter/material.dart';
import 'package:master_bot/components/app_bar_widget.dart';
import 'package:master_bot/components/custom_buttom.dart';
import 'package:master_bot/components/slider.dart';
import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/sozduk_detals_model.dart';

import 'package:master_bot/models/suroo_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key, required this.suroo, required this.sozdor});

  final List<Suroo> suroo;
  final List<Sozdor> sozdor;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  int yndex = 0;
  int tuuraJoop = 0;

  int katajoop = 0;
  Color ozgormoColor = AppColor.contColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 227, 177),
      appBar: AppBar(
        backgroundColor: AppColor.appBarBaground,
        title: AppBarWidget(
          suroolordunSany: yndex,
          tuuraJoop: tuuraJoop,
          kataJoop: katajoop,
        ),
      ),
      body: Column(
        children: [
          sliderWidget(value: yndex.toDouble()),
          Container(
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            height: 100,
            color: AppColor.contColor,
            child: Align(
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
          ),
          CustomButton(
            // color: (isTrue) {
            //   if (isTrue == true) {
            //     widget.joopColor[index].color;
            //   } else {
            //     ozgormoColor;
            //   }
            // },
            onTap: (isTrue) {
              if (isTrue == true) {
                tuuraJoop++;
              } else {
                katajoop++;
              }
              setState(() {
                widget.suroo[yndex++];
              });
              if (yndex == widget.suroo.length) {
                yndex--;
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
                            textStyle: Theme.of(context).textTheme.labelLarge,
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
            },
            jooptor: widget.suroo[yndex].jooptor,
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.sozdor[index++];
                  if (index == widget.sozdor.length) {
                    // index--;
                    index = 0;
                  }
                });
              },
              child: Container(
                width: double.infinity,
                height: 330,
                color: AppColor.contColor,
                child: Column(
                  children: [
                    // CupertinoSlider(
                    //   value: _pomodoroValue,
                    //   min: 30,
                    //   max: 3600,
                    //   divisions: (3600 / 30 - 1).toInt(),
                    //   onChanged: (selectedValue) {
                    //     setState(() {
                    //       _pomodoroValue = selectedValue;
                    //     });
                    //   },
                    // ),
                    // Text(Duration(seconds: _pomodoroValue.toInt()).toHHmmss()),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.sozdor[index].tekst,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
