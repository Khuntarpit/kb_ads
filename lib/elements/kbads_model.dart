import 'dart:convert';

class KbAdsModel {
  KbAdsModel();

  int interstitialTapCount = 3;
  int bannerTapCount = 3;
  int disabledAd = 0;

  KbAdsModel.fromJson(Map<String, dynamic> json){
    interstitialTapCount= json["interstitialTapCount"] ?? 3;
    bannerTapCount= json["bannerTapCount"] ?? 3;
    disabledAd= json["disabledAd"] ?? 0;
  }

  Map<String, dynamic> toJson() => {
    "interstitialTapCount": interstitialTapCount,
    "bannerTapCount": bannerTapCount,
    "disabledAd": disabledAd,
  };
}
