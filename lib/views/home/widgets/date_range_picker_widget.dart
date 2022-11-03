// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRangePickerWidget extends StatelessWidget {
  const DateRangePickerWidget({
    Key? key,
    required EodCubit eodCubit,
    required EodLoadedState state,
  })  : _eodCubit = eodCubit,
        _state = state,
        super(key: key);

  final EodCubit _eodCubit;
  final EodLoadedState _state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton.icon(
            onPressed: () async {
              DateTimeRange? dateRange = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime.now().subtract(Duration(days: 12)),
                  lastDate: DateTime.now());
              if (dateRange == null) return;
              _eodCubit.filterByDateRange(
                  eodList: _state.eodList, dateRange: dateRange);
            },
            icon: Icon(Icons.calendar_month_rounded),
            label:
                Text(DateFormat('yyyy-MM-dd').format(_state.dateRange.start))),
        ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.calendar_month_rounded),
            label: Text(DateFormat('yyyy-MM-dd').format(_state.dateRange.end))),
      ],
    );
  }
}
