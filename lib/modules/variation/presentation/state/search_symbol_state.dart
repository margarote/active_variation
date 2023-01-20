import '../../data/models/chart.dart';

abstract class SearchSymbolState {}

class InitialSearchSymbolState extends SearchSymbolState {}

class LoadingSearchSymbolState extends SearchSymbolState {}

class ErrorSearchSymbolState extends SearchSymbolState {
  final String message;

  ErrorSearchSymbolState(this.message);
}

class SuccessSearchSymbolState extends SearchSymbolState {
  final Chart? chart;

  SuccessSearchSymbolState(this.chart);
}
