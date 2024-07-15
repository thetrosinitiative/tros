import 'dart:convert';

class AirtimeRequestModel {
  String phoneNumber;
  int amount;
  AirtimeRequestModel({
    required this.phoneNumber,
    required this.amount,
  });

  AirtimeRequestModel copyWith({
    String? phoneNumber,
    int? amount,
  }) {
    return AirtimeRequestModel(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'phoneNumber': phoneNumber});
    result.addAll({'amount': amount});

    return result;
  }

  factory AirtimeRequestModel.fromMap(Map<String, dynamic> map) {
    return AirtimeRequestModel(
      phoneNumber: map['phoneNumber'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AirtimeRequestModel.fromJson(String source) =>
      AirtimeRequestModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AirtimeRequestModel(phoneNumber: $phoneNumber, amount: $amount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AirtimeRequestModel &&
        other.phoneNumber == phoneNumber &&
        other.amount == amount;
  }

  @override
  int get hashCode => phoneNumber.hashCode ^ amount.hashCode;
}
