// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/views/home/widgets/date_range_picker_widget.dart';
import 'package:basalt/views/home/widgets/eod_list_view_widget.dart';
import 'package:basalt/views/home/widgets/search_field_widget.dart';
import 'package:flutter/material.dart';

class LoadedViewWidget extends StatelessWidget {
  const LoadedViewWidget({
    Key? key,
    required EodCubit eodCubit,
    required EodLoadedState state,
    required this.screenSize,
  })  : _eodCubit = eodCubit,
        _state = state,
        super(key: key);

  final EodCubit _eodCubit;
  final EodLoadedState _state;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Filter by name or date range'),
                SearchFieldWidget(eodCubit: _eodCubit, state: _state),
                DateRangePickerWidget(eodCubit: _eodCubit, state: _state),
              ],
            ),
          ),
          EodListViewWidget(
              state: _state, screenSize: screenSize, eodCubit: _eodCubit),
        ],
      ),
    );
  }
}
