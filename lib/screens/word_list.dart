import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/data/nouns.dart';
import 'package:word_soup/data/verbs.dart';
import 'package:word_soup/providers/easter_egg_count.dart';

import 'package:word_soup/screens/word_cart_page.dart';
import 'package:word_soup/widgets/word_button.dart';

enum WordType { noun, verb }

class WordList extends ConsumerStatefulWidget {
  const WordList({super.key});

  @override
  WordListState createState() => WordListState();
}

class WordListState extends ConsumerState<WordList> {
  WordType currPage = WordType.noun;

  @override
  Widget build(BuildContext context) {
    final count = ref.watch(easterEggCounter);

    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Select your ${currPage == WordType.noun
                ? "Noun"
                : currPage == WordType.verb
                ? "Verb"
                : "INVALID"}!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 32.0,
              decoration: TextDecoration.none,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (var wordType in WordType.values)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      currPage = wordType;
                    });
                  },
                  child: Text(
                    wordType.toString().split('.').last.toUpperCase(),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemCount: currPage == WordType.noun
                  ? nouns.length
                  : currPage == WordType.verb
                  ? verbs.length
                  : 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                late List<String> words;

                if (currPage == WordType.noun) {
                  words = nouns;
                } else if (currPage == WordType.verb) {
                  words = verbs;
                } else {
                  throw Exception("Invalid word type");
                }

                String itemName = words[index];
                return Center(
                  child: WordButton(itemName: itemName, wordType: currPage,)
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
