import 'package:flutter_riverpod/flutter_riverpod.dart';

class WordCart extends Notifier<List<String>> {
  @override
  List<String> build() => [];

  void addItem(String item) {
    state = [...state, item];
  }

  void removeWord(String word) {
    state = state.where((w) => w != word).toList();
  }
}

final wordCartList = NotifierProvider<WordCart, List<String>>(WordCart.new);
