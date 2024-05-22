import 'package:flutter/material.dart';
import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/color_model.dart';

import 'package:master_bot/models/suroo_model.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.jooptor,
    required this.onTap,
  });

  final List<Joop> jooptor;
  final Function(bool) onTap;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  Color colorTest = AppColor.contColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          final item = widget.jooptor[index];

          return InkWell(
            onTap: () {
              setState(() {});
              widget.onTap(item.isTrue);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: item.color,
              // color: colorTest,
              child: Center(
                  child: Text(
                widget.jooptor[index].text,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              )),
            ),
          );
        },
      ),
    );
  }
}
