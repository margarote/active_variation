import '../consts/app_consts.dart';

import 'failure.dart';

class NetworkFailure extends Failure {
  NetworkFailure() : super(AppConsts.networkError);
}
