// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/locator.dart';
import 'package:basalt/views/home/home_view.dart';

class Routes {
  static const HOME_ROUTE = '/home';
  static final ROUTES = {
    Routes.HOME_ROUTE: (context) => HomeView(eodCubit: getIt.get<EodCubit>()),
  };
}
