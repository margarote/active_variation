import '../../data/models/current_trading_period.dart';
import 'pre_entity.dart';

class CurrentTradingPeriodEntity {
  PreEntity? pre;
  PreEntity? regular;
  PreEntity? post;

  CurrentTradingPeriodEntity({this.pre, this.regular, this.post});

  CurrentTradingPeriod toModel() => CurrentTradingPeriod(
        post: post?.toModel(),
        pre: pre?.toModel(),
        regular: regular?.toModel(),
      );
}
