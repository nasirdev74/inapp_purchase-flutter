import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:inapp_purchase/purchasable_product.dart';

class PurchaseController extends GetxController {
  List<PurchasableProduct> products = [];

  Future loadPurchases() async {
    var iterable = await InAppPurchase.instance.queryProductDetails({'goldcoin', 'silvercoin'});
    for (var element in iterable.productDetails) {
      products.add(PurchasableProduct(element));
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    loadPurchases();
  }
}
