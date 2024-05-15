import 'package:flutter/material.dart';

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
  bool corent = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 90,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: 4,
        itemBuilder: (context, index) {
          final item = widget.jooptor[index];

          return InkWell(
            onTap: () {
              setState(() {}); // color: (isTrue) {
              //   if (isTrue == true) {
              //     widget.joopColor[index].color;
              //   } else {
              //     ozgormoColor;
              //   }
              // },
              // widget.color(item.isTrue);
              corent ? Colors.yellow : widget.onTap(item.isTrue);
              corent = true;
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // color: AppColor.contColor,
              color: item.color,
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
