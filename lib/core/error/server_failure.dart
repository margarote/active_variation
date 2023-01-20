import '../consts/app_consts.dart';
import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure() : super(AppConsts.serverFailureError);
}
