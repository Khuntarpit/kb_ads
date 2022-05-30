
# kb_ads is a custom adview library that is used for initialize and display custom ads.

## Add this dependences in pubspac.yaml
```
  kb_ads: latest_version
```
# Add this meta-data in Androidmenifest.xml
```
       <meta-data 
           android:name="com.google.android.gms.ads.APPLICATION_ID"
           android:value="ca-app-pub-3940256099942544~3347511713"/>
```
# initialize package with required ids using `KbAds.init` function in main.dart file in initState() function
```
   KbAds.init(
      bannerAdUnitId:'ca-app-pub-3940256099942544/6300978111',
      interstitialAdUnitId: 'ca-app-pub-3940256099942544/1033173712',
    );

```
# BannerAd integration : 
## first of all in initState() function we can load banner using `KbAds.initializeBannerAdCount` function and use `adsViews.bannerAd()` to display bannerAd view  
```
 KbAdsViews adsViews = KbAdsViews();
  @override
  void initState() {
    initAdsData();
    super.initState();
  }
  initAdsData()async{
    await KbAds.initializeBannerAdCount(adsViews,);
  }

   adsViews.bannerAd()
```
# InterstitialAd integration : 
##  
```
// if we navigate to other page then use this function
KbAds.addInterstitialAdCountWithNavigation(onDismissClicked: () {
      
},);

// if we does not navigate to other page then use this function
KbAds.addInterstitialAdCountWithoutNavigation();
```

## main.dart 
```
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
```

