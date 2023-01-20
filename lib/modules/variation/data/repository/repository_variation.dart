import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/error/network_failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/error/unknow_failure.dart';
import '../../domain/entities/chart_entity.dart';
import '../../domain/repository/i_repository_variation.dart';
import '../datasources/i_datasource_variation.dart';

class RepositoryVariation implements IRepositoryVariation {
  final IDatasourceVariation datasource;
  RepositoryVariation(this.datasource);

  @override
  Future<Either<Failure, ChartEntity?>> searchSymbol(String symbol) async {
    try {
      final result = await datasource.searchSymbol(symbol);
      return Right(result.toEntity());
    } catch (e) {
      log(e.toString());

      switch (e.runtimeType) {
        case ServerFailure:
          return Left(e as ServerFailure);
        case NetworkFailure:
          return Left(e as NetworkFailure);
        default:
          return Left(UnknowFailure());
      }
    }
  }
}
