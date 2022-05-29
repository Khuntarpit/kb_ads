import 'package:flutter/material.dart';
import 'package:kb_ads/kb_ads.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  KBAdsViews adsViews = KBAdsViews();
  KbAdsModel adsModel= KbAdsModel();
  @override
  void initState() {
    super.initState();
    KBAds.init(
      bannerAdUnitId:'ca-app-pub-3940256099942544/6300978111',
      interstitialAdUnitId: 'ca-app-pub-3940256099942544/1033173712',
      kbAdsModel: adsModel,
    );
    KBAds.initializeBannerAdCount(adsViews,);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weetech Ads Plugin'),
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      RaisedButton(
                        child: Text("Interstitial Ad"),
                        onPressed: () {
                          KBAds.addInterstitialAdCountWithNavigation(onDismissClicked: () {

                          },);
                        },
                      ),
                      RaisedButton(
                        child: Text("Banner Ad"),
                        onPressed: () {
                          KBAds.addBannerAdCount(adsViews);
                        },
                      ),
                    ],
                  )
                )
              ),
              adsViews.bannerAd(),
            ],
          ),
        ),
      ),
    );
  }
}
