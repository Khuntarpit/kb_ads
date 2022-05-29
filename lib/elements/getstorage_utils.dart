import 'package:get_storage/get_storage.dart';

class GetStorageUtil {
  static GetStorage? getStorage;
  static setStorage(){
    getStorage = GetStorage();
  }

  // ---------------------- String ----------------------
  static setStorageString(String key, String value) {
    if(getStorage == null) setStorage();
    getStorage!.write(key, value);
  }

  static String getStorageString(String key) {
    if(getStorage == null) setStorage();
    return  getStorage!.read(key) ?? '';
  }

  // ---------------------- Bool ----------------------
  static setStorageBool(String key, bool value) {
    if(getStorage == null) setStorage();
     getStorage!.write(key, value);
  }

  static bool getStorageBool(String key) {
    if(getStorage == null) setStorage();
    return  getStorage!.read(key)  ?? false;
  }

  // ---------------------- Double ----------------------
  static setStorageDouble(String key, double value) {
    if(getStorage == null) setStorage();
     getStorage!.write(key, value);
  }

  static double getStorageDouble(String key) {
    if(getStorage == null) setStorage();
    return  getStorage!.read(key) ?? 0.0;
  }

  // ---------------------- Integer ----------------------
  static setStorageInteger(String key, int value) {
    if(getStorage == null) setStorage();
     getStorage!.write(key, value);
  }

  static int getStorageInteger(String key) {
    if(getStorage == null) setStorage();
    return getStorage!.read(key) ?? 0;
  }

  // ---------------------- List<String> ----------------------
  static setStorageList(String key, List value) {
    if(getStorage == null) setStorage();
     getStorage!.write(key, value);
  }

  static List getStorageList(String key) {
    if(getStorage == null) setStorage();
    return getStorage!.read(key) ?? [];
  }

}
