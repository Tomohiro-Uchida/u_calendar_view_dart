import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'u_calendar_view_dart_platform_interface.dart';

/// An implementation of [UCalendarViewDartPlatform] that uses method channels.
class MethodChannelUCalendarViewDart extends UCalendarViewDartPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('u_calendar_view_dart');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
