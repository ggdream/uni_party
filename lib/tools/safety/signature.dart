import 'package:convert/convert.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uni_party/tools/device/device.dart';

import 'encrypt.dart';
import 'hash.dart';

class Signature {
  static const String key = '0102030405060708';
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static _AndroidInfo _getAndroidInfo(AndroidDeviceInfo info) {
    return _AndroidInfo(
      sdkInt: info.version.sdkInt!,
      release: info.version.release!,
      brand: info.brand!,
      isPhysicalDevice: info.isPhysicalDevice!,
      androidId: info.androidId!,
    );
  }

  static _IOSInfo _getIOSInfo(IosDeviceInfo info) {
    return _IOSInfo(
      name: info.name!,
      version: info.systemVersion!,
      release: info.utsname.release!,
      sysname: info.utsname.sysname!,
      isPhysicalDevice: info.isPhysicalDevice,
      iosId: info.identifierForVendor!,
    );
  }

  static Future<String> getAndroidSign(String data) async {
    // final info = await _deviceInfoPlugin.androidInfo;
    // final val = _getAndroidInfo(info);
    // final identifier = [
    //   val.sdkInt.toString(),
    //   val.release,
    //   val.brand,
    //   val.isPhysicalDevice.toString()
    // ].join("/");
    final time = DateTime.now().millisecondsSinceEpoch;
    final hash = Hasher.toMD5(time.toString());
    final aes = EncAES(key, hash.substring(16));
    return hex.encode(aes.encrypt(data).bytes);
  }

  static Future<String> getIOSSign(String data) async {
    // final info = await _deviceInfoPlugin.iosInfo;
    // final val = _getIOSInfo(info);
    // final identifier = [
    //   val.name,
    //   val.version,
    //   val.release,
    //   val.sysname,
    //   val.isPhysicalDevice,
    //   val.iosId,
    // ];
    final time = DateTime.now().millisecondsSinceEpoch;
    final hash = Hasher.toMD5(time.toString());
    final aes = EncAES(key, hash.substring(16));
    return hex.encode(aes.encrypt(data).bytes);
  }

  static Future<String> sign(String data) async {
    if (DeviceType.isAndroid) {
      return await getAndroidSign(data);
    } else if (DeviceType.isIOS) {
      return await getIOSSign(data);
    } else {
      return "";
    }
  }
}

class _AndroidInfo {
  final int sdkInt; // 26
  final String release; // 8.0.0
  final String brand; // google
  final bool isPhysicalDevice; // false
  final String androidId; // 998921b52c7a7b79

  _AndroidInfo({
    required this.sdkInt,
    required this.release,
    required this.brand,
    required this.isPhysicalDevice,
    required this.androidId,
  });
}

class _IOSInfo {
  final String name; // iPhone XR
  final String version; // 12.1
  final String release; // 18.2.0
  final String sysname; // Darwin
  final bool isPhysicalDevice; // false
  final String iosId; // 367F5936-39E1-4DFA-8DD2-9542424256BE

  _IOSInfo({
    required this.name,
    required this.version,
    required this.release,
    required this.sysname,
    required this.isPhysicalDevice,
    required this.iosId,
  });
}
