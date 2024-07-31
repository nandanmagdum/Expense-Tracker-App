import 'package:expense_tracker/controllers/wallet_controller.dart';
import 'package:expense_tracker/utils/app_routers.dart';
import 'package:expense_tracker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMoneyPage extends StatelessWidget {
  const AddMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? dateTime;
    return Scaffold(
      appBar: AppBar(
        title: Text("${Get.arguments ? "Add" : "Spend"} Money ${Get.arguments ? "to" : "from"} Wallet"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Widgets.formField(
                  title: "Amount",
                  isNumber: true,
                  hint: "Enter Amount",
                  controller: Get.find<WalletController>().amountController),
              Widgets.formField(
                  title: "Reason",
                  isNumber: false,
                  hint: "Enter Reason",
                  controller: Get.find<WalletController>().reasonController),
              Widgets.formField(
                  title: "Person Involved",
                  isNumber: false,
                  hint: "Enter name of the person involved",
                  controller: Get.find<WalletController>().personController),
              Obx(() => Get.find<WalletController>().dateTime.value == null ? Text("") : Text(Get.find<WalletController>().dateTime.toString()),),
              Widgets.appButton(
                  name: "Select Date and Time",
                  function: () async {
                    final DateTime? date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2500),
                        initialDate: DateTime.now());
                    if (date != null) {
                      final TimeOfDay? time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                      if (time != null) {
                        dateTime = DateTime(date.year, date.month, date.day,
                            time.hour, time.minute);
                        Get.find<WalletController>().dateTime.value = dateTime;
                        Get.find<WalletController>().dateTime.refresh();
                      }
                    }
                  }),
              SizedBox(
                height: Get.height * 0.08,
              ),
              Widgets.appButton(
                  name: "${Get.arguments? "Add" : "Spend"} Money",
                  function: () {
                    Get.find<WalletController>().changeAmount(
                        credit: Get.arguments,
                        amount: double.parse(
                            Get.find<WalletController>().amountController.text),
                        reason:
                            Get.find<WalletController>().reasonController.text,
                        transactionTime: dateTime,
                        person_involved:
                            Get.find<WalletController>().personController.text);
                    Get.find<WalletController>().emptyControllers();
                    Get.back();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
