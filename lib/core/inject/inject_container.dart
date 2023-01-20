import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../modules/splash/presentation/controller/splash_controller.dart';
import '../../modules/variation/data/datasources/datasource_variation.dart';
import '../../modules/variation/data/datasources/i_datasource_variation.dart';
import '../../modules/variation/data/repository/repository_variation.dart';
import '../../modules/variation/domain/repository/i_repository_variation.dart';
import '../../modules/variation/domain/usecases/calculated_variation.dart';
import '../../modules/variation/domain/usecases/search_symbol.dart';
import '../../modules/variation/presentation/controllers/search_symbol_controller.dart';
import '../api/api_inteceptor.dart';
import '../api/i_api_interceptor.dart';
import '../device/i_network_info.dart';
import '../device/internet_address_lookup.dart';
import '../device/network_info.dart';
import '../usecases/closed_app.dart';
import '../usecases/get_base_url.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  //External
  sl.registerLazySingleton(() => Dio());

  //Core
  sl.registerLazySingleton(() => CalculatedVariation());
  sl.registerLazySingleton(() => GetBaseUrl());
  sl.registerLazySingleton(() => ClosedApp());
  sl.registerLazySingleton<IApiInterceptor>(() => ApiInterceptor(sl()));
  sl.registerLazySingleton(() => InternetAddressLookup());
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));

  //Splash
  sl.registerLazySingleton(() => SplashController(sl()));

  //Variation
  sl.registerLazySingleton(() => SearchSymbolController(sl()));
  sl.registerLazySingleton(() => SearchSymbol(sl()));
  sl.registerLazySingleton<IDatasourceVariation>(() => DatasourceVariation(sl(), sl(), sl()));
  sl.registerLazySingleton<IRepositoryVariation>(() => RepositoryVariation(sl()));
}
