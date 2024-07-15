import 'dart:convert';

import 'package:tros/utils/constants/enums.dart';
import 'package:tros/utils/constants/image_strings.dart';

class ExchangeDummy {
  static final List exchangeData = [
    ExchangeDummyModel(
        image: PImages.alat,
        title: 'Convert to cash',
        description: 'Exchange your points now for real cash',
        type: TransactionTypes.bank.name,
        amount: 10000,
        bigDescription:
            'There is good news! Now you can exchange your Tros coin for cash using ALAT by WEMA  with  as little as Tr 10,000, hurry up and exchange your tros points  now'),
    ExchangeDummyModel(
        image: PImages.airtime,
        title: 'Get airtime',
        description: 'Best offers on airtime deal',
        type: TransactionTypes.airtime.name,
        amount: 200,
        bigDescription:
            'Exchange your Tros coin for airtime  with  as little as Tr 200, hurry up and exchange your tros points  now'),
    ExchangeDummyModel(
        image: PImages.donate,
        title: 'DONATE',
        description: 'Donate today to save lifes',
        type: TransactionTypes.donate.name,
        amount: 4000,
        bigDescription:
            'Donate your Tros coin to save lifes  with  as little as Tr 4000, contribute to the growth and health of the society'),
    ExchangeDummyModel(
        image: PImages.airtime,
        title: 'Get airtime',
        description: 'Best offers on airtime deal',
        type: TransactionTypes.airtime.name,
        amount: 300,
        bigDescription:
            'Exchange your Tros coin for airtime  with  as little as Tr 300, hurry up and exchange your tros points  now'),
    ExchangeDummyModel(
        image: PImages.chicken,
        title: 'Chicken Republic',
        description: 'Get amazing food deals',
        type: TransactionTypes.food.name,
        amount: 500,
        bigDescription:
            'Exchange your Tros coin for a meal ticket  with  as little as Tr 4000, hurry up and exchange your tros points  now'),
  ];

  int getExchangeLength() => exchangeData.length;
  ExchangeDummyModel getExchange(index) => exchangeData[index];

  List getExchangeList() => exchangeData;
}

class ExchangeDummyModel {
  String image;
  String title;
  String description;
  String bigDescription;
  String type;
  int amount;
  ExchangeDummyModel({
    required this.image,
    required this.title,
    required this.description,
    required this.bigDescription,
    required this.type,
    required this.amount,
  });

  ExchangeDummyModel copyWith({
    String? image,
    String? title,
    String? description,
    String? bigDescription,
    String? type,
    int? amount,
  }) {
    return ExchangeDummyModel(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
      bigDescription: bigDescription ?? this.bigDescription,
      type: type ?? this.type,
      amount: amount ?? this.amount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'image': image});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'bigDescription': bigDescription});
    result.addAll({'type': type});
    result.addAll({'amount': amount});

    return result;
  }

  factory ExchangeDummyModel.fromMap(Map<String, dynamic> map) {
    return ExchangeDummyModel(
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      bigDescription: map['bigDescription'] ?? '',
      type: map['type'] ?? '',
      amount: map['amount']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExchangeDummyModel.fromJson(String source) =>
      ExchangeDummyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ExchangeDummyModel(image: $image, title: $title, description: $description, bigDescription: $bigDescription, type: $type, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ExchangeDummyModel &&
        other.image == image &&
        other.title == title &&
        other.description == description &&
        other.bigDescription == bigDescription &&
        other.type == type &&
        other.amount == amount;
  }

  @override
  int get hashCode {
    return image.hashCode ^
        title.hashCode ^
        description.hashCode ^
        bigDescription.hashCode ^
        type.hashCode ^
        amount.hashCode;
  }
}
