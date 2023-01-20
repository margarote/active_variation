abstract class SplashState {}

class InitialSplashState extends SplashState {}

class LoadingSplashState extends SplashState {}

class ErrorSplashState extends SplashState {
  final String message;

  ErrorSplashState(this.message);
}

class SuccessSplashState extends SplashState {
  final bool isConnected;

  SuccessSplashState(this.isConnected);
}
