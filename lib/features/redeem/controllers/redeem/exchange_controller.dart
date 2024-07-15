import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/features/personalization/controllers/userController.dart';
import 'package:uuid/uuid.dart';

import '../../../../common/loaders/loaders.dart';
import '../../../../data/dummy_data/exchange_data.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/local_storage/storage_utility.dart';
import '../../models/redeem/exchange_model.dart';

class ExchangeController extends GetxController {
  static ExchangeController get instance => Get.find();

  final exchangeController = TextEditingController();
  final userController = UserController.instance;
  final exchangeQuantityInCart = 0.obs;

  final totalPrice = 0.0.obs;
  RxList<ExchangeModel> exchangeModels = <ExchangeModel>[].obs;
  GlobalKey<FormState> exchangeKey = GlobalKey<FormState>();

  // LOAD TRANSACTIONS ON INITIALIZATIOM
  ExchangeController() {
    loadTransactionItems();
  }

// make transaction
  void makeTransaction(ExchangeDummyModel exchange) async {
    // CHECK INTERNET CONNECTIVITY
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      PLoaders.errorSnackBar(
          title: "Ooops!", message: 'No internet connection');

      return;
    }
    if (exchangeController.text.trim().isEmpty) {
      PLoaders.errorSnackBar(title: "Ooops!", message: 'field is required');
      return;
      // make a post request with the airtime or amount
      // using dummy date at the moment
    }
    if (exchange.amount > userController.userModel.value.balance) {
      PLoaders.errorSnackBar(
          title: "Ooops!",
          message: 'your tros balance is low for this transaction');
      return;
    }

    convertToExchange(exchange);
  }

// Convert an Exhange to model representation
  void convertToExchange(ExchangeDummyModel exchange) {
    final date = DateTime.now();
    final id = const Uuid().v4();
    ExchangeModel exchangeModel = ExchangeModel(
        accountId: userController.userModel.value.id,
        type: exchange.type,
        image: exchange.image,
        title: exchange.title,
        amount: exchange.amount,
        date: date,
        id: id,
        v: 0);
    exchangeController.text = '';
    addToTransactionList(exchangeModel);
  }

// convert exchanges to transaction representation
  void createTransaction() {}

  // add exchange to transaction
  void addToTransactionList(ExchangeModel exchange) {
    userController.userModel.update((user) {
      user!.balance -= exchange.amount;
    });

    exchangeModels.add(exchange);
    updateExchange();
    updateUser(userController.userModel.value.balance.toInt());

    // TRIGGER A SUCCESS MESSAGE
    PLoaders.customToast(
        message: 'Your Exchange has been added to Transactions');
  }

// remove exchange from transaction
  void removeFromTransactionList(ExchangeModel exchange) {
    userController.userModel.update((user) {
      user!.balance += exchange.amount;
    });
    exchangeModels.remove(exchange);
    updateExchange();
    updateUser(userController.userModel.value.balance.toInt());

    // TRIGGER A SUCCESS MESSAGE
    PLoaders.customToast(
        message: 'Your Exchange has been removed from Transactions');
  }

  // SAVE CATITEMS IN LOCAL STORAGE
  void saveTransactionItem() {
    final exchanges = exchangeModels.map((item) => item.toMap()).toList();
    PLocalStorage.instance().saveData('exchanges', exchanges);
    exchangeModels.refresh();
    debugPrint('exchanges saved');
  }

  // GET CARTITEMS FROM LOCAL STORAGE
  void loadTransactionItems() async {
    // await PLocalStorage.init(userController.userModel.value.id);

    final eschangeItems =
        PLocalStorage.instance().readData<List<dynamic>>('exchanges');
    if (eschangeItems != null) {
      exchangeModels.assignAll(eschangeItems
          .map((item) => ExchangeModel.fromMap(item as Map<String, dynamic>)));
      updateCartTotals();

      debugPrint('exchanges loaded');
    } else {
      return;
    }
  }

  // check tros balance
  // void checkTrosBalance() {}

// get total amount in transaction
  // UPDATE THE TOTAL PRICE AND NUMBER OF ITEMS
  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    for (var item in exchangeModels) {
      calculatedTotalPrice += (item.amount);
    }
    totalPrice.value = calculatedTotalPrice;
    exchangeQuantityInCart.value = exchangeModels.length;
    update();
  }

  // dispose all disposables
  void clear() {
    exchangeController.clear();
  }

  void updateExchange() {
    saveTransactionItem();

    updateCartTotals();
    exchangeModels.refresh();
  }

  void updateUser(int balance) {
    userController.saveBalance(balance);
  }

  @override
  void onClose() {
    clear();
    super.onClose();
  }
}
