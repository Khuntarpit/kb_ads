export 'elements/kb_ads_views.dart';
export 'elements/kb_ads_helper.dart';
export 'elements/kb_ads_helper.dart';
export 'elements/kbads_model.dart';

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'elements/getstorage_utils.dart';
import 'elements/kbads_model.dart';
import 'elements/kb_ads_helper.dart';
import 'elements/kb_ads_views.dart';

class KBAds {
  static String banner_Tap_Count = "banner_Tap_Count";
  static String interstitial_Tap_Count = "interstitial_Tap_Count";
  static String disabled_Ad = "disabled_Ad";

  static String banner_ad_count = "banner_ad_count";
  static String interstitial_ad_count = "interstitial_ad_count";

  KBAds.init({
    required String bannerAdUnitId,
    required String interstitialAdUnitId,
    required KbAdsModel kbAdsModel,
  }){
    KBAdsHelper.bannerAdUnitId = bannerAdUnitId;
    KBAdsHelper.interstitialAdUnitId = interstitialAdUnitId;
    setAdData(kbAdsModel);
}

  static setAdData(KbAdsModel data){
    GetStorageUtil.setStorageInteger(banner_Tap_Count, data.bannerTapCount);
    GetStorageUtil.setStorageInteger(interstitial_Tap_Count, data.interstitialTapCount);
    GetStorageUtil.setStorageInteger(disabled_Ad, data.disabledAd);
  }

  static addBannerAdCount(KBAdsViews adView,{String? bannerAdUnitId}){
    if(GetStorageUtil.getStorageInteger(disabled_Ad) == 0){
      GetStorageUtil.setStorageInteger(banner_ad_count,GetStorageUtil.getStorageInteger(banner_ad_count) + 1);
      int position = GetStorageUtil.getStorageInteger(banner_Tap_Count);
      if(GetStorageUtil.getStorageInteger(banner_ad_count) >= position) {
        GetStorageUtil.setStorageInteger(banner_ad_count,0);
        initializeBannerAdCount(adView,bannerAdUnitId: bannerAdUnitId);
      }
    }
  }

  static initializeBannerAdCount(KBAdsViews view,{String? bannerAdUnitId}){
    if(GetStorageUtil.getStorageInteger(disabled_Ad) == 0){
      // KBAdsViews.bannerAdNotifier.value?.dispose();
      view.bannerAdNotifier.value = null;
      BannerAd bannerAd = loadBannerAd(bannerAdUnitId: bannerAdUnitId);
      bannerAd.load();
      Future.delayed(Duration(milliseconds: 500),() {
        view.bannerAdNotifier.value = bannerAd;
      },);
    }
  }

  static BannerAd loadBannerAd({String? bannerAdUnitId}) {
    BannerAd bannerAd = BannerAd(
      adUnitId: bannerAdUnitId ?? KBAdsHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner, // bannerAd size as per need
      listener: BannerAdListener(
        onAdLoaded: (_) {
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );
    return bannerAd;
  }

  static addInterstitialAdCountWithNavigation({VoidCallback? showProgressDialogDismiss,required VoidCallback onDismissClicked,String? interstitialAdUnitId}){
    if(GetStorageUtil.getStorageInteger(disabled_Ad) == 0){
      GetStorageUtil.setStorageInteger(interstitial_ad_count,GetStorageUtil.getStorageInteger(interstitial_ad_count) + 1);
      int position = GetStorageUtil.getStorageInteger(interstitial_Tap_Count);
      if(GetStorageUtil.getStorageInteger(interstitial_ad_count) >= position) {
        GetStorageUtil.setStorageInteger(interstitial_ad_count,0);
        loadInterstitialAd(onDismissClicked: onDismissClicked,interstitialAdUnitId: interstitialAdUnitId);
      } else {
        onDismissClicked();
      }
    }
  }

  static addInterstitialAdCountWithoutNavigation(){
    if(GetStorageUtil.getStorageInteger(disabled_Ad) == 0){
      GetStorageUtil.setStorageInteger(interstitial_ad_count,GetStorageUtil.getStorageInteger(interstitial_ad_count) + 1);
    }
  }

  static Future loadInterstitialAd({VoidCallback? showProgressDialogDismiss,required VoidCallback onDismissClicked,String? interstitialAdUnitId}) async {
    if(GetStorageUtil.getStorageInteger(disabled_Ad) == 0){
      await InterstitialAd.load(
        adUnitId: interstitialAdUnitId ?? KBAdsHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            if(showProgressDialogDismiss != null ){
              showProgressDialogDismiss();
            }
            print('onAdLoaded to load an interstitial ad: ${ad.adUnitId}');
            ad.show();
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                // _moveToHome();
                print(' Here is  ----->>>> onAdDismissedFullScreenContent: ${ad.toString()}');
                onDismissClicked();
              },
            );
          },
          onAdFailedToLoad: (err) {
            print('Failed to load an interstitial ad: ${err.message}');
          },
        ),

      );
    }
  }

  static bool loadNativeAd({String? nativeAdUnitId}) {
    bool isAdLoaded = false;
    NativeAd nativeAd = NativeAd(
      adUnitId: nativeAdUnitId ?? KBAdsHelper.nativeAdUnitId,
      factoryId: 'listTile',
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (_) {
          isAdLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          isAdLoaded= false;
          // Releases an ad resource when it fails to load
          ad.dispose();
          print('Ad load failed (code=${error.code} message=${error.message})');       },
      ),
    );
    return isAdLoaded;
  }

  static void loadRewardedAd(VoidCallback onDismissClicked,{String? rewardedAdUnitId}) {
    RewardedAd.load(
      adUnitId: rewardedAdUnitId ?? KBAdsHelper.rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              onDismissClicked();
            },
          );
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

}
