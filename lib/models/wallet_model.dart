import 'package:get/get.dart';
class WalletModel {
  double amount;
  WalletModel({required this.amount});

  Map<String, dynamic> toJson() => {
    "amount": amount
  };

  factory WalletModel.fromJson(Map<String, dynamic> json)
    => WalletModel(amount: json['amount']);
}