import 'package:in_app_purchase/in_app_purchase.dart';

///flutter inAppPurchase에서 가져온 class 이므로 inapppurchase 사용하지 않을 시 오류 생길 수 잆음
///
///     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.rawPrice,
//     required this.currencyCode,
//     this.currencySymbol = '',
///
extension ToolsWithProductDetails on ProductDetails {
  String toDetailString() {
    return 'detail product -> id : $id,\ntitle :$title  \n description: $description, \n price:  $price,'
        '\n rawPrice: $rawPrice,  \n currencyCode: $currencyCode';
  }
}

extension ToolsWithDateTime on PurchaseDetails {
  String toDetailString() {
    return 'PurchaseDetails -> purchaseID : $purchaseID,\productID :$productID  \n status: $status, \n transactionDate:  $transactionDate,'
        '\n verificationData: ${verificationData.localVerificationData}';
  }
}
