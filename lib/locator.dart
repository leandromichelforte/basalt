import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/repositories/eod_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

GetIt getIt = GetIt.instance;

setupLocator() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(connectTimeout: 8000)),
      signalsReady: true);

  getIt.registerSingleton<InternetConnectionChecker>(
      InternetConnectionChecker(),
      signalsReady: true);

  getIt.registerSingleton<EodRepository>(EodRepository(dio: getIt.get<Dio>()),
      signalsReady: true);

  getIt.registerFactory<EodCubit>(() => EodCubit(
      repository: getIt.get<EodRepository>(),
      connectionChecker: getIt.get<InternetConnectionChecker>()));
}
