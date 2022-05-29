import 'dart:math';
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
      return _bannerId ?? 'ca-app-pub-3940256099942544/6300978111';
  }

  static String get interstitialAdUnitId {
      return _interstitialId ?? "ca-app-pub-3940256099942544/1033173712";
  }


  static String get nativeAdUnitId {
      return _nativeAdId ?? 'ca-app-pub-3940256099942544/2247696110';
  }


  static String get rewardedAdUnitId {
      return _rewardedAdId ?? "ca-app-pub-3940256099942544/5224354917";
  }

  static String get appOpenAdUnitId {
      return _appOpenId ?? "ca-app-pub-3940256099942544/3419835294";
  }
}