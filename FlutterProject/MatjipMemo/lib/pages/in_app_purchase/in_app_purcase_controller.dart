import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:matjipmemo/controller/login_controller.dart';
import 'package:matjipmemo/data/repo/helper/serializable.dart';
import 'package:matjipmemo/pages/in_app_purchase/tools.dart';
import 'package:matjipmemo/route/get_parameters.dart';
import 'package:matjipmemo/tools/logger.dart';

import '../../data/repo/user_network_repository.dart';
import '../../models/firebase/user_model.dart';

class InAppPurchaseController extends GetxController {
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  final RxBool _purchasePending = false.obs;
  bool get purchasePending => _purchasePending.value;
  UserModel? thisUser = Get.find<LoginController>().userModel;
  RxList<String> logList = ['로그 리스트'].obs;
  bool isLog = false;
  @override
  void onInit() {
    super.onInit();
    if (Serializable.fromBool(Get.parameters[GetParameters.isMaster])) {
      isLog = true;
    }
    addLog('onInit');
    final Stream<List<PurchaseDetails>> purchaseUpdated = InAppPurchase.instance.purchaseStream;
    _subscription = purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      // handle error here.
    });

    //한번 해보고 FutureBuilder로 넣자!
    if (thisUser == null) {
      addLog('userModel is null');
      Future.microtask(() => Get.back());
      return;
    }
  }

  @override
  void onClose() {
    _subscription.cancel();
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition = InAppPurchase.instance.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    super.onClose();
  }

  void addLog(String log) {
    logList.add(log);
    logger.d(log);
  }

  void _showPendingUI() {
    _purchasePending.value = true;
  }

  void _handleError(IAPError error) {
    addLog('error occur \n $error');
    _purchasePending.value = false;
  }

  Future<void> _deliverProduct(PurchaseDetails purchaseDetails) async {
    addLog('_deliverProduct');
    addLog('purchaseDetails ${purchaseDetails.toDetailString()}');

    ///Firebase에다가 구매한 것 올리기
    await userNetworkRepository.inAppPurchase(userModel: thisUser!, purchaseDetails: purchaseDetails);
  }

  void onClickPurchaseItem(ProductDetails product) async {
    addLog('print purchase $product');

    final ProductDetails productDetails = product; // Saved earlier from queryProductDetails().
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: productDetails);
    InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
    addLog('print purchase ${productDetails.id}');
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    addLog('_handleInvalidPurchase');
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    addLog('_verifyPurchase');
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) async {
    addLog('_listenToPurchaseUpdated');
    for (PurchaseDetails purchaseDetails in purchaseDetailsList) {
      switch (purchaseDetails.status) {
        case PurchaseStatus.pending:
          _showPendingUI();
          break;
        case PurchaseStatus.error:
          _handleError(purchaseDetails.error!);
          //  await _deliverProduct(purchaseDetails); 테스트용으로 한 번 넣어봤음
          break;
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            await _deliverProduct(purchaseDetails);
          } else {
            _handleInvalidPurchase(purchaseDetails);
          }
          break;
        case PurchaseStatus.canceled:
          break;
      }
      if (purchaseDetails.pendingCompletePurchase) {
        addLog('purchaseDetails.pendingCompletePurchase');
        await InAppPurchase.instance.completePurchase(purchaseDetails);
      }
    }
  }

  Future<List<ProductDetails>> loadingProductForSale() async {
    //앱 금액이 변경되었을 때 조치를 하는 것을 말하는 것 같다. 굳이 안해도 될 듯 한데, 나중에 삭제할 때 dispose부분이랑 같이 삭제하면 될 듯?
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition = InAppPurchase.instance.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final Set<String> _kIds = <String>{if (isLog) 'gold_150', 'gold_1000', 'gold_2000', 'gold_5000', 'gold_10000'};
    final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(_kIds);
    addLog('response : $response');
    List<ProductDetails> products = response.productDetails..sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
    // for (ProductDetails e in products) {
    //   addLog(e.toDetailString());
    // }
    if (response.notFoundIDs.isNotEmpty) {
      // Handle the error.
      addLog('response.notFoundIDs.isNotEmpty ${response.notFoundIDs}');
    }
    return products;
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
