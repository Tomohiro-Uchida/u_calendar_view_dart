#import "UCalendarViewDartPlugin.h"
#if __has_include(<u_calendar_view_dart/u_calendar_view_dart-Swift.h>)
#import <u_calendar_view_dart/u_calendar_view_dart-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "u_calendar_view_dart-Swift.h"
#endif

@implementation UCalendarViewDartPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftUCalendarViewDartPlugin registerWithRegistrar:registrar];
}
@end
