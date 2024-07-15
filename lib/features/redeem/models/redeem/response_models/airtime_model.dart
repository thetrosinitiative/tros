import 'dart:convert';

class AirtimeModel {
  String accountId;
  int amount;
  DateTime date;
  String id;
  int v;
  AirtimeModel({
    required this.accountId,
    required this.amount,
    required this.date,
    required this.id,
    required this.v,
  });

  AirtimeModel copyWith({
    String? accountId,
    int? amount,
    DateTime? date,
    String? id,
    int? v,
  }) {
    return AirtimeModel(
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      id: id ?? this.id,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accountId': accountId});
    result.addAll({'amount': amount});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'id': id});
    result.addAll({'v': v});

    return result;
  }

  factory AirtimeModel.fromMap(Map<String, dynamic> map) {
    return AirtimeModel(
      accountId: map['accountId'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      id: map['id'] ?? '',
      v: map['v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AirtimeModel.fromJson(String source) =>
      AirtimeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AirtimeModel(accountId: $accountId, amount: $amount, date: $date, id: $id, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AirtimeModel &&
        other.accountId == accountId &&
        other.amount == amount &&
        other.date == date &&
        other.id == id &&
        other.v == v;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        id.hashCode ^
        v.hashCode;
  }
}
