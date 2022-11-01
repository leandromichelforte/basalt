import 'package:basalt/models/eod_model.dart';
import 'package:basalt/repositories/eod_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Should return a eod list or the status code from api request error',
      () async {
    final eodData = await EodRepository(dio: Dio()).fetchData();
    expect([List<EodModel>, int].contains(eodData.runtimeType), true);
  });
}
