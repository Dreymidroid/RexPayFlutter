import 'package:rexpay/rexpay.dart';
import 'package:rexpay/src/core/common/rexpay.dart';

abstract class BaseRequestBody {
  final fieldDevice = 'device';
  String? _device;

  BaseRequestBody() {
    _setDeviceId();
  }

  Map<String, String?> paramsMap();

  String? get device => _device;

  _setDeviceId() {
    String deviceId = "device id string";
    // String deviceId = RexpayPlugin.platformInfo.deviceId;
    this._device = deviceId;
  }
}
