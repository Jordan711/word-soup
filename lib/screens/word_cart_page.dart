import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/providers/word_cart/noun_cart.dart';
import 'package:word_soup/providers/word_cart/verb_cart.dart';
import 'package:word_soup/screens/thank_you.dart';

class WordCartPage extends ConsumerWidget {
  const WordCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> nounCart = ref.watch(nounCartList);
    final List<String> verbCart = ref.watch(verbCartList);

    return Container(
      padding: EdgeInsets.all(32.0),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              nounCart.isEmpty
                  ? Text("No Nouns Selected!")
                  : Text("Your Nouns - ${nounCart.length}"),
              Text(nounCart.join(', ')),
            ],
          ),
          Column(
            children: [
              verbCart.isEmpty
                  ? Text("No Verbs Selected!")
                  : Text("Your Verbs - ${verbCart.length}"),
              Text(verbCart.join(', ')),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => Scaffold(body: ThankYou())),
              );
            },
            child: Text("Checkout"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back"),
          ),
        ],
      ),
    );
  }
}
