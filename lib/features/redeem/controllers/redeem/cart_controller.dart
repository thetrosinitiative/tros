import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tros/features/personalization/controllers/userController.dart';

import 'package:tros/utils/local_storage/storage_utility.dart';

import '../../../../common/loaders/loaders.dart';
import '../../models/cart_item_model.dart';
import '../../models/redeem/redeem_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  // final userController = UserController.instance;

  @override
  void onReady() {
    // super.onInit();
  }

  CartController() {
    loadCartItems();
  }
  // VARIABLES
  final noOfCartItems = 0.obs;
  final totalCartPrice = 0.0.obs;
  final productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final userController = UserController.instance;

  // /ADD ITEMS TO CART
  void addToCart(ProductModel product) {
    if (product.price > userController.userModel.value.balance) {
      PLoaders.errorSnackBar(
          title: "Ooops!",
          message: 'your tros balance is low for this product');
      return;
    }
    try {
      if (productQuantityInCart.value < 1) {
        PLoaders.customToast(message: 'Select Quantity');
        return;
      }

      if (product.stock < 1) {
        PLoaders.warningSnackBar(
            message: 'Selected product is out of stock', title: 'Oh Snap!!');
        return;
      }

      // CONVERT PRODUCTMODEL TO CARTMODEL
      final selectedCartItem =
          convertToCartItem(product, productQuantityInCart.value);

      // CHECK IF PRODUCT IS ALREADY IN THE CART
      int index = cartItems.indexWhere(
          (cartItem) => cartItem.productId == selectedCartItem.productId);
      if (index >= 0) {
        // THIS QUANTITY IS AREADY ADDED OR UPDATED/REMOVED FROM THE CART
        cartItems[index].quantity += selectedCartItem.quantity;
      } else {
        cartItems.add(selectedCartItem);
      }
      userController.userModel.update((user) {
        user!.balance -= product.price;
      });

      // UPDATE THE USER CART
      updateCart();
      // UPDATE THE PRODUCT QUANTITY IN CART
      productQuantityInCart.value = 0;
      update();
      // UPDATE THE USER  BALANCE IN LOCAL STORAGE
      updateUser(userController.userModel.value.balance.toInt());

      // TRIGGER A SUCCESS MESSAGE
      PLoaders.customToast(message: 'Your Product has been added to Cart');
    } catch (e) {
      return;
    }
  }

// CONVERT PRODUCT TO CARTMMODELITEM
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      price: product.price.toDouble(),
      title: product.name,
      image: product.image,
    );
  }

// ADD ONE ITEM TO CART
  void addItemToCart(CartItemModel item) {
    if (item.price > userController.userModel.value.balance) {
      PLoaders.errorSnackBar(
          title: "Ooops!",
          message: 'your tros balance is low for this product');
      return;
    }
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    userController.userModel.update((user) {
      user!.balance -= item.price;
    });
    updateCart();
    updateUser(userController.userModel.value.balance.toInt());
    PLoaders.customToast(message: 'Product has been added to Cart');
  }

  // REMOVE ONE ITEM IN CART
  void removeItemFromCart(CartItemModel item) {
    int index = cartItems
        .indexWhere((cartItem) => cartItem.productId == item.productId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // SHOW A DIALOG BEFORE REMOVING

        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    userController.userModel.update((user) {
      user!.balance += item.price;
    });
    updateCart();
    updateUser(userController.userModel.value.balance.toInt());

    PLoaders.customToast(message: 'Product has been removed to Cart');
  }

  // INITIALIZE ALREADY ADDED PRODUCT
  // void updateAlreadyAddedProductInCart(ProductModel product) {
  //   // if product has no variation then calculate cartEntries and display total number.
  //   // Else make default entries to 0 and show cartEntries when variation is selected

  //   productQuantityInCart.value = getProductQuantityInCart(product.id);
  // }

  // UPDATE THE LOCAL STORAGE OF SPECIFIC USER
  void updateCart() {
    updateCartTotals();
    saveCartItem();
    cartItems.refresh();
    // debugPrint(cartItems.length.toString());
  }

// UPDATE THE TOTAL PRICE AND NUMBER OF ITEMS
  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartPrice.value = calculatedTotalPrice;
    noOfCartItems.value = calculatedNoOfItems;
  }

// SAVE CATITEMS IN LOCAL STORAGE
  void saveCartItem() {
    final cartItemStrings = cartItems.map((item) => item.toMap()).toList();
    debugPrint(cartItems.toString());
    PLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

// GET CARTITEMS FROM LOCAL STORAGE
  void loadCartItems() async {
    final cartItemsStrings =
        PLocalStorage.instance().readData<List<dynamic>>('cartItems');
    debugPrint(cartItemsStrings.toString());
    if (cartItemsStrings != null) {
      cartItems.assignAll(cartItemsStrings
          .map((item) => CartItemModel.fromMap(item as Map<String, dynamic>)));
      updateCartTotals();
    } else {
      return;
    }
  }

  // GET PRODUCT QUANTITY
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, item) => previousValue + item.quantity);
    return foundItem;
  }

// CLEAR THE CART
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

// SHOW DIALOG
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
        title: 'Remove Product',
        middleText: 'Are you sure you want to remove this product?',
        onConfirm: () {
          // REMOVE THE ITEM FROM CART
          cartItems.removeAt(index);
          updateCart();
          PLoaders.customToast(message: 'Product removed from the Cart');
          Get.back();
        },
        onCancel: () => () => Get.back());
  }

  void updateUser(int balance) {
    userController.saveBalance(balance);
  }
}
