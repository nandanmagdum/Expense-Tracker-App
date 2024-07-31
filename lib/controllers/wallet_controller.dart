import 'dart:convert';

import 'package:expense_tracker/models/transaction_model.dart';
import 'package:expense_tracker/utils/Db.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/wallet_model.dart';

class WalletController extends GetxController {
  Rx<WalletModel> wallet = Rx(WalletModel(amount: 0));
  RxList<TransactionModel> list = <TransactionModel>[].obs;

  TextEditingController amountController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  TextEditingController personController = TextEditingController();

  Rx<DateTime?> dateTime = null.obs;

  @override
  void onInit() {
    loadDataFromLocal();
    super.onInit();
  }

  // save data to local
  void saveDataToLocal() {
    Db.p.setString(Db.wallet, jsonEncode(wallet.value.toJson()));
    Db.p.setStringList(
        Db.list,
        list
            .map(
              (element) => jsonEncode(element.toJson()),
            )
            .toList());
  }

  // load data from local
  void loadDataFromLocal() {
    final localData = Db.p.getString(Db.wallet);
    if (localData != null) {
      wallet.value = WalletModel.fromJson(jsonDecode(localData));
      wallet.refresh();
    }
    final localData2 = Db.p.getStringList(Db.list);
    if (localData2 != null) {
      // List<String> => List<TransactionModel>
      List<TransactionModel> tempList = localData2
          .map((e) => TransactionModel.fromJson(jsonDecode(e)))
          .toList();
      list.value = tempList;
      sortTransactions();
      list.refresh();
    }
  }

  void changeAmount(
      {required bool credit,
      required double amount,
      required String? reason,
      required DateTime? transactionTime,
      required String? person_involved}) {
    wallet.value.amount =
        credit ? wallet.value.amount + amount : wallet.value.amount - amount;
    wallet.refresh();
    final newTransaction = TransactionModel(
        credit: credit,
        amount: amount,
        reason: reason,
        person_involved: person_involved,
        transactionTime: transactionTime);
    list.add(newTransaction);
    sortTransactions();
    list.refresh();
    saveDataToLocal();
  }

  void sortTransactions() {
    list.sort((a, b) => b.transactionTime!.compareTo(a.transactionTime!));
    list.refresh();
  }

  void emptyControllers(){
    amountController.text = "";
    personController.text = "";
    reasonController.text = "";
  }
}
