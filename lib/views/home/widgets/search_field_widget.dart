// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/models/eod_model.dart';
import 'package:flutter/material.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({
    Key? key,
    required EodCubit eodCubit,
    required List<EodModel> eodList,
  })  : _eodCubit = eodCubit,
        _eodList = eodList,
        super(key: key);

  final EodCubit _eodCubit;
  final List<EodModel> _eodList;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('Name'),
        suffixIcon: Icon(Icons.search),
        floatingLabelStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            // color: Colors.pink,
          ),
        ),
      ),
      onChanged: (value) {
        _eodCubit.filterList(value, _eodList);
      },
    );
  }
}
