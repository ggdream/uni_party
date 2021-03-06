import 'package:uni_party/tools/device/device.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions {
  Permissions._();

  static bool get _isMobile => DeviceType.isMobile;

  static List<Permission> _requestList = [
    Permission.storage,
    Permission.camera,
    Permission.photos,
    Permission.mediaLibrary,
    Permission.location,
    Permission.speech,
  ];

  static bool _permissionStatus(PermissionStatus status) =>
      status == PermissionStatus.denied; // return true if denied

  static Future<bool> _request(Permission type) async {
    var status = await type.status;
    if (_permissionStatus(status)) {
      status = await type.request();
    }
    return _permissionStatus(status); // return true if denied
  }

  static Future<bool> request() async {
    if (!_isMobile) return true;

    for (var i in _requestList) {
      if (await _request(i)) return false;
    }
    return true;
  }
}
