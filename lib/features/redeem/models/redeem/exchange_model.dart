import 'dart:convert';

class ExchangeModel {
  String accountId;
  String type;
  String image;
  String title;
  int amount;
  DateTime date;
  String id;
  int? v;
  ExchangeModel({
    required this.accountId,
    required this.type,
    required this.image,
    required this.title,
    required this.amount,
    required this.date,
    required this.id,
    required this.v,
  });

  ExchangeModel copyWith({
    String? accountId,
    String? type,
    String? image,
    String? title,
    int? amount,
    DateTime? date,
    String? id,
    int? v,
  }) {
    return ExchangeModel(
      accountId: accountId ?? this.accountId,
      type: type ?? this.type,
      image: image ?? this.image,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      id: id ?? this.id,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'accountId': accountId});
    result.addAll({'type': type});
    result.addAll({'image': image});
    result.addAll({'title': title});
    result.addAll({'amount': amount});
    result.addAll({'date': date.millisecondsSinceEpoch});
    result.addAll({'id': id});
    if (v != null) {
      result.addAll({'v': v});
    }

    return result;
  }

  factory ExchangeModel.fromMap(Map<String, dynamic> map) {
    return ExchangeModel(
      accountId: map['accountId'] ?? '',
      type: map['type'] ?? '',
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      id: map['id'] ?? '',
      v: map['v']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExchangeModel.fromJson(String source) =>
      ExchangeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExchangeModel(accountId: $accountId, type: $type, image: $image, title: $title, amount: $amount, date: $date, id: $id, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExchangeModel &&
        other.accountId == accountId &&
        other.type == type &&
        other.image == image &&
        other.title == title &&
        other.amount == amount &&
        other.date == date &&
        other.id == id &&
        other.v == v;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        type.hashCode ^
        image.hashCode ^
        title.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        id.hashCode ^
        v.hashCode;
  }
}
