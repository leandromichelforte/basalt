// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/models/eod_model.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
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
    return Autocomplete<EodModel>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          _eodCubit.showEod(eodList: _state.eodList);
          return const Iterable<EodModel>.empty();
        }
        return _state.eodList.where((element) => element.name!
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: (EodModel selectedEod) {
        _eodCubit.showEod(eodList: _state.eodList, eod: selectedEod);
      },
    );
  }
}
