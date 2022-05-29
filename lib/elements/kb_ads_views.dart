import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class KBAdsViews {
  ValueNotifier<BannerAd?> bannerAdNotifier = ValueNotifier(null);

  Widget bannerAd(){
   return ValueListenableBuilder<BannerAd?>(
        valueListenable: bannerAdNotifier,
        builder: (context,value,child) {
          return value == null ? SizedBox() : Builder(
            builder: (context) {
              return Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: value.size.width.toDouble(),
                        height: value.size.height.toDouble(),
                        child: AdWidget(ad: value)
                    ),
                  ));
            }
          );
        }
    );
  }

  static Widget showNoItemsFound(height,message){
    return SafeArea(
      child: Container(
        height: height,
        color: Colors.white,
        child: Center(
          child: Text(
            message,style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
