import 'package:get/get.dart';
import 'package:inapp_purchase/purchase_controller.dart';

class InAppPurchaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PurchaseController());
  }
}
