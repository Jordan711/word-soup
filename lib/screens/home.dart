import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:word_soup/providers/easter_egg_count.dart';
import 'package:word_soup/screens/word_list.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final easterEggCount = ref.watch(easterEggCounter);
    
    return Container(
      padding: EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome to Word Soup", style: TextStyle(color: Colors.black, fontSize: 32.0, decoration: TextDecoration.none),),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Scaffold(body: WordList())));
          }, child: Text("Create a sentence")),
                    GestureDetector(
            onTap: () {
              ref.read(easterEggCounter.notifier).increment();
            },
            child: Text(
              "Version $easterEggCount",
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
