import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/providers/word_cart.dart';


class ThankYou extends ConsumerWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> wordCart = ref.watch(wordCartList);
    String sentence = "${(List.of(wordCart)..shuffle()).join(' ')}!!";


    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          Text("Here is your sentence:"),
          Text(sentence)
        ],
      ),
    );
  }
}