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
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 24,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.STOCK_MARKET_ICON),
                ),
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width * .7,
                child: Text(
                  "Name: ${eod.name}",
                  style: const TextStyle(
                      fontSize: 16, overflow: TextOverflow.ellipsis),
                ),
              ),
              if (eod.date != null)
                Text(
                  "Date: ${DateFormat('yyyy-MM-dd').format(eod.date!)}",
                  style: const TextStyle(fontSize: 16),
                ),
            ],
          )
        ]),
      ),
    );
  }
}
