//
//  Copyright (c) 2016 Google Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
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
  
// Remaining contents of your AppDelegate Class...
}
