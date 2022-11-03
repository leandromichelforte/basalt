// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/models/eod_model.dart';
import 'package:basalt/views/home/widgets/eod_card_widget.dart';
import 'package:flutter/material.dart';

class EodListViewWidget extends StatelessWidget {
  const EodListViewWidget({
    Key? key,
    required EodLoadedState state,
    required this.screenSize,
    required EodCubit eodCubit,
  })  : _state = state,
        _eodCubit = eodCubit,
        super(key: key);

  final EodLoadedState _state;
  final Size screenSize;
  final EodCubit _eodCubit;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      if (_state.selectedEod != null) {
        return EodCardWidget(screenSize: screenSize, eod: _state.selectedEod!);
      } else {
        if (_state.filteredEodList != null && _state.filteredEodList!.isEmpty) {
          return Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nothing to show in this date range'),
                  SizedBox(height: 10),
                  ElevatedButton.icon(
                      onPressed: () {
                        DateTimeRange dateRange = DateTimeRange(
                            start: DateTime.now().subtract(Duration(days: 12)),
                            end: DateTime.now());
                        _eodCubit.filterByDateRange(
                            eodList: _state.eodList, dateRange: dateRange);
                      },
                      icon: Icon(Icons.replay_rounded),
                      label: Text('Reset date range'))
                ],
              ),
            ),
          );
        }
        return Expanded(
          child: ListView.separated(
            itemBuilder: (_, i) {
              EodModel eod;
              eod = _state.eodList.elementAt(i);
              if (_state.filteredEodList != null) {
                eod = _state.filteredEodList!.elementAt(i);
              }
              return EodCardWidget(screenSize: screenSize, eod: eod);
            },
            separatorBuilder: (_, __) => SizedBox(height: 10),
            itemCount: (![null, []].contains(_state.filteredEodList))
                ? _state.filteredEodList!.length
                : _state.eodList.length,
          ),
        );
      }
    });
  }
}
