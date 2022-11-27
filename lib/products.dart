import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:inapp_purchase/purchasable_product.dart';
import 'package:inapp_purchase/purchase_controller.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurchaseController>(
      autoRemove: false,
      assignId: true,
      builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.products.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildProduct(controller.products[index]);
          },
        );
      },
    );
  }

  _buildProduct(PurchasableProduct product) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Material(
        color: Colors.tealAccent,
        borderRadius: BorderRadius.circular(5),
        child: InkWell(
          onTap: () => buy(product),
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${product.title.split(' ')[0]} ${product.title.split(' ')[1]}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(product.price),
                  ],
                ),
                Row(
                  children: [
                    Text(product.description),
                    const Spacer(),
                    Text(product.status.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> buy(PurchasableProduct product) async {
    final purchaseParam = PurchaseParam(productDetails: product.productDetails);
    await InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  }
}
