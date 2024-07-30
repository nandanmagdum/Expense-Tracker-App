class TransactionModel {
  bool credit;
  double amount;
  String? reason;
  DateTime? transactionTime;
  String? person_involved;
  TransactionModel(
      {required this.credit,
      required this.amount,
      this.reason,
      this.transactionTime,
      this.person_involved});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
          credit: json['credit'],
          amount: json['amount'],
          person_involved: json['person_involved'],
          reason: json['reason'],
          transactionTime: json['transactionTime'] != null
              ? DateTime.parse(json['transactionTime'])
              : null);

  Map<String, dynamic> toJson() => {
    "credit": credit,
    "amount": amount,
    "reason": reason,
    "transactionTime": transactionTime?.toIso8601String(),
    "person_involved": person_involved
  };
}
