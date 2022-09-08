import UIKit
import Flutter
import KakaoSDKCommon

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
//    NSString *NATIVE_KEY = [FlutterConfigPlugin envFor:@"KAKAO_NATIVE"];
    KakaoSDK.initSDK(appKey: "d63ad66fcf018467fbe418b15491940b")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
