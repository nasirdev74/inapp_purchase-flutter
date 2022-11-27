import 'products.dart';
import 'banner_ads.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:inapp_purchase/bindings.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const adUnitId = 'ca-app-pub-3940256099942544/6300978111';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize google ad
  MobileAds.instance.initialize();

  /// check in app purchase
  final bool isAvailable = await InAppPurchase.instance.isAvailable();
  Get.log('InAppPurchase.instance.isAvailable: ${isAvailable.toString()}');
  runApp(const InAppPurchaseApp());
}

class InAppPurchaseApp extends StatelessWidget {
  const InAppPurchaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      initialBinding: InAppPurchaseBindings(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 70),
        children: [
          BannerAds(),
          const Products(),
        ],
      ),
    );
  }
}
