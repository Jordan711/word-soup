import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/screens/word_list.dart';

import 'package:word_soup/providers/word_cart/noun_cart.dart';
import 'package:word_soup/providers/word_cart/verb_cart.dart';

class WordButton extends StatelessWidget {
  final String itemName;
  final WordType wordType;
  const WordButton({super.key, required this.itemName, required this.wordType});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        bool itemSelected = false;

        if (wordType == WordType.noun) {
          itemSelected = ref.watch(nounCartList).contains(itemName);
        } else if (wordType == WordType.verb) {
          itemSelected = ref.watch(verbCartList).contains(itemName);
        } else {
          throw Exception('Invalid word type set');
        }

        return GestureDetector(
          onTap: () {
            if (wordType == WordType.noun) {
              if (itemSelected) {
                ref.read(nounCartList.notifier).removeNoun(itemName);
              } else {
                ref.read(nounCartList.notifier).addNoun(itemName);
              }
            } else if (wordType == WordType.verb) {
              if (itemSelected) {
                ref.read(verbCartList.notifier).removeVerb(itemName);
              } else {
                ref.read(verbCartList.notifier).addVerb(itemName);
              }
            } else {
              throw Exception('Invalid word type set');
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
