import 'package:expense_tracker/controllers/wallet_controller.dart';
import 'package:expense_tracker/pages/add_money_page.dart';
import 'package:expense_tracker/pages/history_page.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/utils/Db.dart';
import 'package:expense_tracker/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Db.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(WalletController());
      },),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouters.homeRoute,
      getPages: [
        GetPage(name: AppRouters.homeRoute, page: () => HomePage(),),
        GetPage(name: AppRouters.historyRoute, page: () => HistoryPage(),),
        GetPage(name: AppRouters.addMoneyRoute, page: () => AddMoneyPage(),),
      ],
    );
  }
}
