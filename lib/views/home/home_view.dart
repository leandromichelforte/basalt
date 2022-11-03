// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/views/home/widgets/error_view_widget.dart';
import 'package:basalt/views/home/widgets/loaded_view_widget.dart';
import 'package:basalt/views/home/widgets/loading_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key, required EodCubit eodCubit})
      : _eodCubit = eodCubit,
        super(key: key);

  final EodCubit _eodCubit;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BlocProvider.value(
      value: _eodCubit,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(title: Text('EOD List'), centerTitle: true),
          body: BlocBuilder<EodCubit, EodState>(
            builder: (context, state) {
              if (state is EodInitialState) {
                _eodCubit.fetchData();
              }
              if (state is EodErrorState) {
                return ErrorViewWidget(
                  eodCubit: _eodCubit,
                  errorMessage: state.errorMessage,
                );
              }
              if (state is EodLoadedState) {
                return LoadedViewWidget(
                    eodCubit: _eodCubit, state: state, screenSize: screenSize);
              }
              return LoadingViewWidget();
            },
          ),
        ),
      ),
    );
  }
}
