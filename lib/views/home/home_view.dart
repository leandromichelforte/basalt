// ignore_for_file: prefer_const_constructors

import 'package:basalt/cubit/eod_cubit.dart';
import 'package:basalt/models/eod_model.dart';
import 'package:basalt/views/home/widgets/eod_card_widget.dart';
import 'package:basalt/views/home/widgets/search_field_widget.dart';
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
              if (state is EodLoadedState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 20),
                        child: SearchFieldWidget(
                            eodCubit: _eodCubit, eodList: state.eodList),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (_, i) {
                            EodModel eod;
                            if (state.filteredEodList.isEmpty) {
                              eod = state.eodList.elementAt(i);
                            } else {
                              eod = state.filteredEodList.elementAt(i);
                            }
                            return EodCardWidget(
                                screenSize: screenSize, eod: eod);
                          },
                          separatorBuilder: (_, __) => SizedBox(height: 10),
                          itemCount: state.filteredEodList.isEmpty
                              ? state.eodList.length
                              : state.filteredEodList.length,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
