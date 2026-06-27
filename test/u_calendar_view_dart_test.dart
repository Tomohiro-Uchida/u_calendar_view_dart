import 'package:flutter_test/flutter_test.dart';
import 'package:u_calendar_view_dart/u_calendar_view_dart_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUCalendarViewDartPlatform
    with MockPlatformInterfaceMixin
    implements UCalendarViewDartPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
}
