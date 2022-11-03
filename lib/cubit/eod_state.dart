part of 'eod_cubit.dart';

@immutable
abstract class EodState {}

class EodInitialState extends EodState {}

class EodLoadingState extends EodState {}

class EodErrorState extends EodState {
  EodErrorState({required this.errorMessage});
  final String errorMessage;
}

class EodLoadedState extends EodState {
  EodLoadedState(
      {required this.eodList,
      required this.dateRange,
      this.selectedEod,
      this.filteredEodList});
  final List<EodModel> eodList;
  final DateTimeRange dateRange;
  final EodModel? selectedEod;
  final List<EodModel>? filteredEodList;
}
