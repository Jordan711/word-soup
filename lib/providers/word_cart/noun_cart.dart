import 'package:flutter_riverpod/flutter_riverpod.dart';

class NounCart extends Notifier<List<String>> {
  @override
  List<String> build() => [];

  void addNoun(String item) {
    state = [...state, item];
  }

  void removeNoun(String noun) {
    state = state.where((w) => w != noun).toList();
  }

  void clearCart() {
    state = [];
  }
}

final nounCartList = NotifierProvider<NounCart, List<String>>(NounCart.new);
