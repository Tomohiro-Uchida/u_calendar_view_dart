#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint u_calendar_view_dart.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'u_calendar_view_dart'
  s.version          = '0.0.1'
  s.summary          = 'CalendarView for Dart/Flutter'
  s.description      = <<-DESC
CalendarView for Dart/Flutter
                       DESC
  s.homepage         = 'https://github.com/Tomohiro-Uchida/u_calendar_view_dart'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tomohiro Uchida' => 'uchida001tmhr@indigosoftwareinc.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'u_calendar_view_dart/Sources/u_calendar_view_dart/**/*'
  s.resource_bundles = {
    'u_calendar_view_dart_privacy' => ['u_calendar_view_dart/Sources/u_calendar_view_dart/PrivacyInfo.xcprivacy']
  }
  s.dependency 'Flutter'
  s.platform         = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
