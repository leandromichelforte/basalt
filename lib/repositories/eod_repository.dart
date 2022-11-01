import 'package:basalt/constants/constants.dart';
import 'package:basalt/models/eod_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EodRepository {
  EodRepository({required Dio dio}) : _dio = dio;
  final Dio _dio;

  Future fetchData() async {
    try {
      final response = await _dio.get(
          Constants.urlBase + Constants.urlSuffixExchange,
          queryParameters: {
            'access_key': Constants.accessKey,
            'symbols': 'AAPL,GOOGL,MSFT,AMZN,BABA,PG,VOD,JNJ,WMT,MA',
          });
      List<EodModel> eodList = [];
      for (var eod in response.data['data']) {
        eodList.add(EodModel.fromMap(eod));
      }
      return eodList;
    } on DioError catch (e) {
      debugPrint(e.message);
      return e.response?.statusCode;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
