import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/data/words.dart';
import 'package:word_soup/providers/easter_egg_count.dart';
import 'package:word_soup/providers/word_cart.dart';
import 'package:word_soup/screens/word_cart_page.dart';
import 'package:word_soup/widgets/word_button.dart';

enum WordType { noun, verb }

class WordList extends ConsumerStatefulWidget {
  const WordList({super.key});

  @override
  WordListState createState() => WordListState();
}

class WordListState extends ConsumerState<WordList> {
  @override
  Widget build(BuildContext context) {
    final count = ref.watch(easterEggCounter);
    final wordCart = ref.watch(wordCartList);

    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select your words!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemCount: words.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                String itemName = words[index];
                bool itemSelected = wordCart.contains(itemName);

                return Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: itemSelected
                          ? Border.all(color: Colors.green, width: 2)
                          : Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(5.4),
                    ),
                    child: WordButton(itemName: itemName),
                  ),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => Scaffold(body: WordCartPage()),
                ),
              );
            },
            child: Text("Generate Sentence"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Back"),
          ),

          GestureDetector(
            onTap: () {
              ref.read(easterEggCounter.notifier).increment();
            },
            child: Text(
              "Version $count",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
