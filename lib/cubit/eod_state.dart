part of 'eod_cubit.dart';

@immutable
abstract class EodState {}

class EodInitialState extends EodState {}

class EodLoadingState extends EodState {}

class EodErrorState extends EodState {}

class EodLoadedState extends EodState {
  EodLoadedState({required this.eodList, required this.filteredEodList});
  final List<EodModel> eodList;
  final List<EodModel> filteredEodList;
}
