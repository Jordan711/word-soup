import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/providers/word_cart.dart';

class WordButton extends StatelessWidget {
  final String itemName;
  const WordButton({super.key, required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Consumer(
  builder: (context, ref, child) {
    bool itemSelected = ref.watch(wordCartList).contains(itemName);
    return GestureDetector(
      onTap: () {
        if (itemSelected) {
          ref.read(wordCartList.notifier).removeWord(itemName);
        } else {
          ref.read(wordCartList.notifier).addItem(itemName);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: itemSelected
              ? Border.all(color: Colors.green, width: 2)
              : Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(5.4),
        ),
        padding: EdgeInsets.all(18),
        child: Text(itemName),
      ),
    );
  },
);
  }
}