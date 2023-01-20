import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/chart_entity.dart';
import '../repository/i_repository_variation.dart';

class SearchSymbol {
  final IRepositoryVariation repository;

  SearchSymbol(this.repository);

  Future<Either<Failure, ChartEntity?>> call(String symbol) {
    return repository.searchSymbol(symbol);
  }
}
