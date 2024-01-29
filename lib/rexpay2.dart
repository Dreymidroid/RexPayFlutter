
import 'rexpay_platform_interface.dart';

class Rexpay {
  Future<String?> getPlatformVersion() {
    return RexpayPlatform.instance.getPlatformVersion();
  }
}
