import 'dart:convert';
import 'package:intl/intl.dart';

class EodModel {
  double? open;
  double? high;
  double? low;
  double? close;
  double? volume;
  double? adjHigh;
  double? adjLow;
  double? adjClose;
  double? adjOpen;
  double? adjVolume;
  double? splitFactor;
  double? dividend;
  String? symbol;
  String? exchange;
  String? name;
  DateTime? date;
  EodModel(
      {this.open,
      this.high,
      this.low,
      this.close,
      this.volume,
      this.adjHigh,
      this.adjLow,
      this.adjClose,
      this.adjOpen,
      this.adjVolume,
      this.splitFactor,
      this.dividend,
      this.symbol,
      this.exchange,
      this.date,
      this.name});

  EodModel copyWith({
    double? open,
    double? high,
    double? low,
    double? close,
    double? volume,
    double? adjHigh,
    double? adjLow,
    double? adjClose,
    double? adjOpen,
    double? adjVolume,
    double? splitFactor,
    double? dividend,
    String? symbol,
    String? exchange,
    String? name,
    DateTime? date,
  }) {
    return EodModel(
      open: open ?? this.open,
      high: high ?? this.high,
      low: low ?? this.low,
      close: close ?? this.close,
      volume: volume ?? this.volume,
      adjHigh: adjHigh ?? this.adjHigh,
      adjLow: adjLow ?? this.adjLow,
      adjClose: adjClose ?? this.adjClose,
      adjOpen: adjOpen ?? this.adjOpen,
      adjVolume: adjVolume ?? this.adjVolume,
      splitFactor: splitFactor ?? this.splitFactor,
      dividend: dividend ?? this.dividend,
      symbol: symbol ?? this.symbol,
      exchange: exchange ?? this.exchange,
      date: date ?? this.date,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (open != null) {
      result.addAll({'open': open});
    }
    if (high != null) {
      result.addAll({'high': high});
    }
    if (low != null) {
      result.addAll({'low': low});
    }
    if (close != null) {
      result.addAll({'close': close});
    }
    if (volume != null) {
      result.addAll({'volume': volume});
    }
    if (adjHigh != null) {
      result.addAll({'adj_high': adjHigh});
    }
    if (adjLow != null) {
      result.addAll({'adj_low': adjLow});
    }
    if (adjClose != null) {
      result.addAll({'adj_close': adjClose});
    }
    if (adjOpen != null) {
      result.addAll({'adj_open': adjOpen});
    }
    if (adjVolume != null) {
      result.addAll({'adj_volume': adjVolume});
    }
    if (splitFactor != null) {
      result.addAll({'split_factor': splitFactor});
    }
    if (dividend != null) {
      result.addAll({'dividend': dividend});
    }
    if (symbol != null) {
      result.addAll({'symbol': symbol});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (exchange != null) {
      result.addAll({'exchange': exchange});
    }
    if (date != null) {
      result.addAll({'date': DateFormat('yyyy-MM-dd').format(date!)});
    }

    return result;
  }

  factory EodModel.fromMap(Map<String, dynamic> map) {
    return EodModel(
      open: map['open']?.toDouble(),
      high: map['high']?.toDouble(),
      low: map['low']?.toDouble(),
      close: map['close']?.toDouble(),
      volume: map['volume']?.toDouble(),
      adjHigh: map['adj_high']?.toDouble(),
      adjLow: map['adj_low']?.toDouble(),
      adjClose: map['adj_close']?.toDouble(),
      adjOpen: map['adj_open']?.toDouble(),
      adjVolume: map['adj_volume']?.toDouble(),
      splitFactor: map['split_factor']?.toDouble(),
      dividend: map['dividend']?.toDouble(),
      symbol: map['symbol'],
      name: map['name'],
      exchange: map['exchange'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EodModel.fromJson(String source) =>
      EodModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Name: $name || Date: ${DateFormat('yyyy-MM-dd').format(date!)}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EodModel &&
        other.open == open &&
        other.high == high &&
        other.low == low &&
        other.close == close &&
        other.volume == volume &&
        other.adjHigh == adjHigh &&
        other.adjLow == adjLow &&
        other.adjClose == adjClose &&
        other.adjOpen == adjOpen &&
        other.adjVolume == adjVolume &&
        other.splitFactor == splitFactor &&
        other.dividend == dividend &&
        other.symbol == symbol &&
        other.exchange == exchange &&
        other.date == date &&
        other.name == name;
  }

  @override
  int get hashCode {
    return open.hashCode ^
        high.hashCode ^
        low.hashCode ^
        close.hashCode ^
        volume.hashCode ^
        adjHigh.hashCode ^
        adjLow.hashCode ^
        adjClose.hashCode ^
        adjOpen.hashCode ^
        adjVolume.hashCode ^
        splitFactor.hashCode ^
        dividend.hashCode ^
        symbol.hashCode ^
        exchange.hashCode ^
        date.hashCode ^
        name.hashCode;
  }
}
