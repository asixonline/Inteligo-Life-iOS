//
//  AppDelegate.swift
//  InteligoLife
//
//  Created by Fischer on 12/19/20.
//

import UIKit
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      // Remove this method to stop OneSignal Debugging
      OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)

      // OneSignal initialization
      OneSignal.initWithLaunchOptions(launchOptions)
      OneSignal.setAppId("96898db2-4ea7-4e10-ab1a-bf0c325b8c3a")

      // promptForPushNotifications will show the native iOS notification permission prompt.
      // We recommend removing the following code and instead using an In-App Message to prompt for notification permission (See step 8)
      OneSignal.promptForPushNotifications(userResponse: { accepted in
        print("User accepted notifications: \(accepted)")
      })

       return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        if let userDefaults = UserDefaults(suiteName: "group.com.inteligolife.onesignal") {
            userDefaults.set("test 1" as AnyObject, forKey: "key1")
            userDefaults.set("test 2" as AnyObject, forKey: "key2")
            userDefaults.synchronize()
        }
        if let userDefaults = UserDefaults(suiteName: "group.com.inteligolife.onesignal") {
            let value1 = userDefaults.string(forKey: "key1")
            let value2 = userDefaults.string(forKey: "key2")
            print("value1 = ", value1?.description ?? "No value")
            print("value2 = ", value2?.description ?? "No value")
        }

        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    
    
}

