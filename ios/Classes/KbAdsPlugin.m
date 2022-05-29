#import "KbAdsPlugin.h"
#if __has_include(<kb_ads/kb_ads-Swift.h>)
#import <kb_ads/kb_ads-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "kb_ads-Swift.h"
#endif

@implementation KbAdsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftKbAdsPlugin registerWithRegistrar:registrar];
}
@end
