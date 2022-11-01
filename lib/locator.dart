import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/repositories/eod_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupLocator() {
  getIt.registerSingleton<Dio>(Dio(BaseOptions(connectTimeout: 8000)),
      signalsReady: true);

  getIt.registerSingleton<EodRepository>(EodRepository(dio: getIt.get<Dio>()),
      signalsReady: true);

  getIt.registerFactory<EodCubit>(
      () => EodCubit(repository: getIt.get<EodRepository>()));
}
