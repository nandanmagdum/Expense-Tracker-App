import 'package:get/get.dart';
import '../models/wallet_model.dart';

class WalletController extends GetxController {
  Rx<WalletModel> wallet = Rx(WalletModel(amount: 0));

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  // save wallet to local

  // retrieve wallet from local
  // set amount
  // get amount
}
