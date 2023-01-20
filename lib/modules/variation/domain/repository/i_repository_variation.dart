import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/chart_entity.dart';

abstract class IRepositoryVariation {
  Future<Either<Failure, ChartEntity?>> searchSymbol(String symbol);
}
