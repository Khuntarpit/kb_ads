
import 'dart:math';

import 'package:get/get.dart';

class KBAdsHelper {

  static String get10DigitNumber(){
    Random random = Random();
    String number = '';
    for(int i = 0; i < 10; i++){
      number = number + random.nextInt(9).toString();
    }
    return number;
  }

  static String? _bannerId;
  static String? _interstitialId;
  static String? _nativeAdId;
  static String? _rewardedAdId;
  static String? _appOpenId;

  static set bannerAdUnitId(val){
    _bannerId = val;
  }

  static set interstitialAdUnitId(val){
    _interstitialId = val;
  }

  static set nativeAdUnitId(val){
    _nativeAdId = val;
  }

  static set rewardedAdUnitId(val){
    _rewardedAdId = val;
  }
  static set appOpenAdUnitId(val){
    _appOpenId = val;
  }

  static String get bannerAdUnitId {
    if (GetPlatform.isAndroid) {
      return _bannerId ?? 'ca-app-pub-3940256099942544/6300978111';
    } else if (GetPlatform.isIOS) {
      return _bannerId ?? 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (GetPlatform.isAndroid) {
      return _interstitialId ?? "ca-app-pub-3940256099942544/1033173712";
    } else if (GetPlatform.isIOS) {
      return _interstitialId ?? "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }


  static String get nativeAdUnitId {
    if (GetPlatform.isAndroid) {
      return _nativeAdId ?? 'ca-app-pub-3940256099942544/2247696110';
    } else if (GetPlatform.isIOS) {
      return _nativeAdId ?? 'ca-app-pub-3940256099942544/3986624511';
    }
    throw UnsupportedError("Unsupported platform");
  }


  static String get rewardedAdUnitId {
    if (GetPlatform.isAndroid) {
      return _rewardedAdId ?? "ca-app-pub-3940256099942544/5224354917";
    } else if (GetPlatform.isIOS) {
      return _rewardedAdId ?? "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get appOpenAdUnitId {
    if (GetPlatform.isAndroid) {
      return _appOpenId ?? "ca-app-pub-3940256099942544/3419835294";
    } else if (GetPlatform.isIOS) {
      return _appOpenId ?? "ca-app-pub-3940256099942544/5662855259";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}