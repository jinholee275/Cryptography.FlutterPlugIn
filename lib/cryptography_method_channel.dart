import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'cryptography_platform_interface.dart';

/// An implementation of [CryptographyPlatform] that uses method channels.
class MethodChannelCryptography extends CryptographyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('cryptography');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
