import Flutter
import UIKit

@objc(UCalendarViewDartPlugin)
public class UCalendarViewDartPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "u_calendar_view_dart", binaryMessenger: registrar.messenger())
    let instance = UCalendarViewDartPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
