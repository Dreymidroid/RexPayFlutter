import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'rexpay_platform_interface.dart';

/// An implementation of [RexpayPlatform] that uses method channels.
class MethodChannelRexpay extends RexpayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('rexpay');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
