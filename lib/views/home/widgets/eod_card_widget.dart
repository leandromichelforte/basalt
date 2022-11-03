// ignore_for_file: prefer_const_constructors

import 'package:basalt/models/eod_model.dart';
import 'package:basalt/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EodCardWidget extends StatelessWidget {
  const EodCardWidget({
    Key? key,
    required this.screenSize,
    required this.eod,
  }) : super(key: key);

  final Size screenSize;
  final EodModel eod;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Colors.grey.shade300,
              Colors.grey.shade300,
              Colors.grey.shade200,
              Colors.grey.shade100,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 24,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(eod.open! <= eod.close!
                      ? AppImages.STOCK_MARKET_GREEN_ICON
                      : AppImages.STOCK_MARKET_RED_ICON),
                ),
              )),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name: ${eod.name ?? 'End-of-day'}",
                  style: const TextStyle(overflow: TextOverflow.ellipsis),
                ),
                if (eod.date != null)
                  Text("Date: ${DateFormat('yyyy-MM-dd').format(eod.date!)}"),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                "Open: ${eod.open}",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
              Text(
                "Close: ${eod.close}",
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              )
            ],
          )
        ]),
      ),
    );
  }
}
