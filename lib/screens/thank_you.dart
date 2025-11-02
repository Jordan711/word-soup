import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/providers/word_cart/noun_cart.dart';
import 'package:word_soup/providers/word_cart/verb_cart.dart';


String _generateSentence(List<String> nouns, List<String> verbs) {
  String sentence = "${(List.of([...nouns, ...verbs])..shuffle()).join(' ')}!!";
  return sentence.toString();
}

class ThankYou extends ConsumerWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> nounCart = ref.watch(nounCartList)..shuffle();
    final List<String> verbCart = ref.watch(verbCartList)..shuffle();

    final String sentence = _generateSentence(nounCart, verbCart);

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