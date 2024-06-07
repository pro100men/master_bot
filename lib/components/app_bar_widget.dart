import 'package:flutter/material.dart';
import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/suroo_model.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.kataJoop,
    required this.suroolordunSany,
    required this.tuuraJoop,
  });
  final int suroolordunSany;
  final int tuuraJoop;
  final int kataJoop;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Card(
          color: AppColor.contColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              children: [
                Text(
                  '$kataJoop',
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.red,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '$suroolordunSany',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  tuuraJoop.toString(),
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: AppColor.contColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
            child: Text(orusSurooIndex.length.toString(),
                style: const TextStyle(fontSize: 22)),
          ),
        ),
        InkWell(
          onTap: () {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  actions: <Widget>[
                    Column(
                      children: [
                        TextButton(
                          child: const Text(' data'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('data'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
          child: const Card(
            color: AppColor.contColor,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child:
                    Icon(Icons.more_vert, color: Color.fromARGB(255, 8, 8, 0))),
          ),
        ),
      ],
    );
  }
}
