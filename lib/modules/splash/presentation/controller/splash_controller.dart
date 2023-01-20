import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/consts/app_consts.dart';
import '../../../../core/device/i_network_info.dart';
import '../states/splash_state.dart';

class SplashController extends ValueNotifier<SplashState> {
  final INetworkInfo networkInfo;
  SplashController(this.networkInfo) : super(InitialSplashState());

  Future<void> isConnectedInternet() async {
    try {
      value = LoadingSplashState();
      await Future.delayed(const Duration(milliseconds: 2500));
      final result = await networkInfo.isConnected;
      value = SuccessSplashState(result);
    } catch (e) {
      log(e.toString());
      value = ErrorSplashState(AppConsts.errorConnectionInternet);
    }
  }
}
