import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:tros/features/redeem/models/redeem/exchange_model.dart';

class TransactionModel {
  String accountId;
  int amount;
  DateTime date;
  String id;
  int? v;
  List<ExchangeModel> redeems;
  TransactionModel({
    required this.accountId,
    required this.amount,
    required this.date,
    required this.id,
    required this.v,
    required this.redeems,
  });

  TransactionModel copyWith({
    String? accountId,
    int? amount,
    DateTime? date,
    String? id,
    int? v,
    List<ExchangeModel>? redeems,
  }) {
    return TransactionModel(
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      id: id ?? this.id,
      v: v ?? this.v,
      redeems: redeems ?? this.redeems,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accountId': accountId});
    result.addAll({'amount': amount});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'id': id});
    if (v != null) {
      result.addAll({'v': v});
    }
    result.addAll({'redeems': redeems.map((x) => x.toMap()).toList()});

    return result;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      accountId: map['accountId'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      id: map['id'] ?? '',
      v: map['v']?.toInt(),
      redeems: List<ExchangeModel>.from(
          map['redeems']?.map((x) => ExchangeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionModel(accountId: $accountId, amount: $amount, date: $date, id: $id, v: $v, redeems: $redeems)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.accountId == accountId &&
        other.amount == amount &&
        other.date == date &&
        other.id == id &&
        other.v == v &&
        listEquals(other.redeems, redeems);
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        id.hashCode ^
        v.hashCode ^
        redeems.hashCode;
  }
}
