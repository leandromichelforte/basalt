// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:basalt/models/eod_model.dart';
import 'package:basalt/repositories/eod_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'eod_state.dart';

class EodCubit extends Cubit<EodState> {
  EodCubit(
      {required EodRepository repository,
      required InternetConnectionChecker connectionChecker})
      : _repository = repository,
        _connectionChecker = connectionChecker,
        super(EodInitialState());
  final EodRepository _repository;
  final InternetConnectionChecker _connectionChecker;

  void fetchData() async {
    emit(EodLoadingState());
    List<EodModel> eodList = [];
    DateTimeRange dateRange = DateTimeRange(
        start: DateTime.now().subtract(Duration(days: 12)),
        end: DateTime.now());

    if (!await _connectionChecker.hasConnection) {
      return emit(EodErrorState(errorMessage: 'No internet conexion'));
    }
    final data = await _repository.fetchData();

    if (data.runtimeType == int) {
      return emit(EodErrorState(errorMessage: 'Error $data has ocurred'));
    }
    if (data.runtimeType == List<EodModel>) {
      for (var eod in data) {
        eod.name = _companyNameFromSymbol(eod.symbol ?? '');
        eodList.add(eod);
      }
      return emit(EodLoadedState(eodList: eodList, dateRange: dateRange));
    }

    return emit(EodErrorState(errorMessage: 'A generic error has ocurred'));
  }

  void showEod({
    required List<EodModel> eodList,
    DateTimeRange? dateRange,
    EodModel? eod,
  }) async {
    DateTimeRange dateRange =
        DateTimeRange(start: DateTime.now(), end: DateTime.now());
    for (var eod in eodList) {
      if (eod.date!.isBefore(dateRange.start)) {
        dateRange = DateTimeRange(
            start: eod.date ?? DateTime.now(), end: DateTime.now());
      }
    }
    emit(EodLoadedState(
        eodList: eodList, selectedEod: eod, dateRange: dateRange));
  }

  String _companyNameFromSymbol(String symbol) {
    String companyName = '';
    switch (symbol) {
      case 'AAPL':
        companyName = 'Apple Inc';
        break;
      case 'GOOGL':
        companyName = 'Alphabet Inc - Class A';
        break;
      case 'MSFT':
        companyName = 'Microsoft Corporation';
        break;
      case 'AMZN':
        companyName = 'Amazon.com Inc';
        break;
      case 'BABA':
        companyName = 'Alibaba Group Holding Ltd';
        break;
      case 'PG':
        companyName = 'Procter & Gamble Company';
        break;
      case 'VOD':
        companyName = 'Vodafone Group plc';
        break;
      case 'JNJ':
        companyName = 'Johnson & Johnson';
        break;
      case 'WMT':
        companyName = 'Walmart Inc';
        break;
      case 'MA':
        companyName = 'Mastercard Incorporated - Class A';
        break;
      default:
    }
    return companyName;
  }

  void filterByDateRange({
    required List<EodModel> eodList,
    required DateTimeRange dateRange,
  }) {
    final filteredEodList = <EodModel>[];
    for (var eod in eodList) {
      if (eod.date!.isAfter(dateRange.start) &&
          eod.date!.isBefore(dateRange.end)) {
        if (!filteredEodList.contains(eod)) {
          filteredEodList.add(eod);
        }
      }
    }
    emit(EodLoadedState(
        eodList: eodList,
        dateRange: dateRange,
        filteredEodList: filteredEodList));
  }
}
