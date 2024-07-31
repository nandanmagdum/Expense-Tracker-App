import 'package:expense_tracker/controllers/wallet_controller.dart';
import 'package:expense_tracker/utils/app_routers.dart';
import 'package:expense_tracker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[900],
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        "Rs. ${Get.find<WalletController>().wallet.value.amount} /-",
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "Wallet",
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Widgets.appButton(
                name: "Add Money",
                function: () {
                  Get.toNamed(AppRouters.addMoneyRoute, arguments: true);
                }),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Widgets.appButton(
                name: "Spend Money",
                function: () {
                  Get.toNamed(AppRouters.addMoneyRoute, arguments: false);
                }),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Widgets.appButton(
                name: "History",
                function: () {
                  Get.toNamed(AppRouters.historyRoute);
                }),
          ],
        ),
      ),
    );
  }
}
