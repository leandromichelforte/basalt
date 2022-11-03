// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:flutter/material.dart';

class ErrorViewWidget extends StatelessWidget {
  const ErrorViewWidget(
      {Key? key, required EodCubit eodCubit, required String errorMessage})
      : _eodCubit = eodCubit,
        _errorMessage = errorMessage,
        super(key: key);

  final EodCubit _eodCubit;
  final String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_errorMessage),
          SizedBox(
            height: 10,
          ),
          ElevatedButton.icon(
              onPressed: () {
                _eodCubit.fetchData();
              },
              icon: Icon(Icons.replay_rounded),
              label: Text('Tap to try again'))
        ],
      ),
    );
  }
}
