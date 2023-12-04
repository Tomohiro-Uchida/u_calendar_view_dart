import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:u_calendar_view_dart/u_calendar_view_dart_method_channel.dart';

void main() {
  MethodChannelUCalendarViewDart platform = MethodChannelUCalendarViewDart();
  const MethodChannel channel = MethodChannel('u_calendar_view_dart');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
