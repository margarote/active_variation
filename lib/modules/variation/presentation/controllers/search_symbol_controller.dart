import 'package:flutter/material.dart';

import '../../domain/usecases/search_symbol.dart';
import '../state/search_symbol_state.dart';

class SearchSymbolController extends ValueNotifier<SearchSymbolState> {
  final SearchSymbol searchSymbol;
  SearchSymbolController(this.searchSymbol) : super(InitialSearchSymbolState());

  Future<void> call(String symbol) async {
    value = LoadingSearchSymbolState();
    final resultFold = await searchSymbol.call(symbol);
    resultFold.fold((l) {
      value = ErrorSearchSymbolState(l.message);
    }, (r) {
      value = SuccessSearchSymbolState(r?.toModel());
    });
  }
}
