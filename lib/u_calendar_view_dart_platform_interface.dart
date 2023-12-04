import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'u_calendar_view_dart_method_channel.dart';

abstract class UCalendarViewDartPlatform extends PlatformInterface {
  /// Constructs a UCalendarViewDartPlatform.
  UCalendarViewDartPlatform() : super(token: _token);

  static final Object _token = Object();

  static UCalendarViewDartPlatform _instance = MethodChannelUCalendarViewDart();

  /// The default instance of [UCalendarViewDartPlatform] to use.
  ///
  /// Defaults to [MethodChannelUCalendarViewDart].
  static UCalendarViewDartPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UCalendarViewDartPlatform] when
  /// they register themselves.
  static set instance(UCalendarViewDartPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
