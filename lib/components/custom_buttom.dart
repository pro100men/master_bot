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
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 100,
        ),
        itemCount: widget.jooptor.length,
        itemBuilder: (context, index) {
          final item = widget.jooptor[index];
          bool isSelected = selectedIndex == index;
          Color itemColor = isSelected
              ? (item.isTrue ? Colors.green : Colors.red)
              : Colors.grey;

          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              // item.color;

              widget.onTap(item.isTrue);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: itemColor,
              child: Center(
                  child: Text(
                item.text,
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
