import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatelessWidget {
  BannerAds({Key? key}) : super(key: key);
  final bannerAds = List.generate(
    20,
    (_) => BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    ),
  );

  Future loadBannerAds() async =>
      await Future.wait(bannerAds.map((e) => e.load()).toList());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadBannerAds(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return ListView.builder(
              shrinkWrap: true,
              itemCount: bannerAds.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(bottom: 20),
                  width: bannerAds[index].size.width.toDouble(),
                  height: bannerAds[index].size.height.toDouble(),
                  child: AdWidget(
                    ad: bannerAds[index],
                  ),
                );
              },
            );
          case ConnectionState.waiting:
            return const Text("Ads loading");
          default:
            return const Text("unknown state");
        }
      },
    );
  }
}
