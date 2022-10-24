import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

        // TODO: Add your Google Maps API key
    GMSServices.provideAPIKey("AIzaSyCC0PE0PpqrILM6XrxYcw1Kr9ljWP3qb0U")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
