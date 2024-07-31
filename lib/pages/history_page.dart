import 'package:expense_tracker/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: ListView.builder(
          itemCount: Get.find<WalletController>().list.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: ListTile(
                title: Text(
                    Get.find<WalletController>().list[index].reason.toString()),
                trailing: Text(
                  "${Get.find<WalletController>().list[index].credit ? "+" : "-"} ${Get.find<WalletController>().list[index].amount.toString()}",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(Get.find<WalletController>()
                    .list[index]
                    .person_involved
                    .toString()),
                tileColor: Get.find<WalletController>().list[index].credit
                    ? Colors.green
                    : Colors.red[900],
                leading: Column(
                  children: [
                    Text(Get.find<WalletController>()
                                .list[index]
                                .transactionTime !=
                            null
                        ? "${Get.find<WalletController>().list[index].transactionTime?.day}"
                        : ""),
                    Text(Get.find<WalletController>()
                                .list[index]
                                .transactionTime !=
                            null
                        ? "${monthList[Get.find<WalletController>().list[index].transactionTime?.month ?? 0]}"
                        : ""),
                    Text(Get.find<WalletController>()
                                .list[index]
                                .transactionTime !=
                            null
                        ? "${Get.find<WalletController>().list[index].transactionTime?.year}"
                        : ""),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

const monthList = [
  "Jan",
  "Feb",
  "March",
  "April",
  "May",
  "June",
  "July",
  "Aug",
  "Sept",
  "Oct",
  "Nov",
  "Dec"
];
