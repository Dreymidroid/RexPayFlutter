import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rexpay_method_channel.dart';

abstract class RexpayPlatform extends PlatformInterface {
  /// Constructs a RexpayPlatform.
  RexpayPlatform() : super(token: _token);

  static final Object _token = Object();

  static RexpayPlatform _instance = MethodChannelRexpay();

  /// The default instance of [RexpayPlatform] to use.
  ///
  /// Defaults to [MethodChannelRexpay].
  static RexpayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RexpayPlatform] when
  /// they register themselves.
  static set instance(RexpayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
