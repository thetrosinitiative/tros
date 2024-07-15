import 'dart:convert';

class BankModel {
  String accountId;
  int amount;
  int ammountInNaira;
  String status;
  DateTime date;
  String id;
  int v;
  BankModel({
    required this.accountId,
    required this.amount,
    required this.ammountInNaira,
    required this.status,
    required this.date,
    required this.id,
    required this.v,
  });

  BankModel copyWith({
    String? accountId,
    int? amount,
    int? ammountInNaira,
    String? status,
    DateTime? date,
    String? id,
    int? v,
  }) {
    return BankModel(
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      ammountInNaira: ammountInNaira ?? this.ammountInNaira,
      status: status ?? this.status,
      date: date ?? this.date,
      id: id ?? this.id,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accountId': accountId});
    result.addAll({'amount': amount});
    result.addAll({'ammountInNaira': ammountInNaira});
    result.addAll({'status': status});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'id': id});
    result.addAll({'v': v});

    return result;
  }

  factory BankModel.fromMap(Map<String, dynamic> map) {
    return BankModel(
      accountId: map['accountId'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      ammountInNaira: map['ammountInNaira']?.toInt() ?? 0,
      status: map['status'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      id: map['id'] ?? '',
      v: map['v']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory BankModel.fromJson(String source) =>
      BankModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BankModel(accountId: $accountId, amount: $amount, ammountInNaira: $ammountInNaira, status: $status, date: $date, id: $id, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BankModel &&
        other.accountId == accountId &&
        other.amount == amount &&
        other.ammountInNaira == ammountInNaira &&
        other.status == status &&
        other.date == date &&
        other.id == id &&
        other.v == v;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        amount.hashCode ^
        ammountInNaira.hashCode ^
        status.hashCode ^
        date.hashCode ^
        id.hashCode ^
        v.hashCode;
  }
}
