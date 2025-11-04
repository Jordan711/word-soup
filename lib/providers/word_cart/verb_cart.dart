import 'package:flutter_riverpod/flutter_riverpod.dart';

class VerbCart extends Notifier<List<String>> {
  @override
  List<String> build() => [];

  void addVerb(String item) {
    state = [...state, item];
  }

  void removeVerb(String verb) {
    state = state.where((w) => w != verb).toList();
  }

  void clearCart() {
    state = [];
  }
}

final verbCartList = NotifierProvider<VerbCart, List<String>>(VerbCart.new);
