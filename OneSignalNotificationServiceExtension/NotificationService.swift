//
//  NotificationService.swift
//  OneSignalNotificationServiceExtension
//
//  Created by Fischer on 12/19/20.
//

import UserNotifications

import OneSignal

class NotificationService: UNNotificationServiceExtension {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var receivedRequest: UNNotificationRequest!
    var bestAttemptContent: UNMutableNotificationContent?
    
    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.receivedRequest = request;
        self.contentHandler = contentHandler
        bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)

        if let bestAttemptContent = bestAttemptContent {
            OneSignal.didReceiveNotificationExtensionRequest(self.receivedRequest, with: self.bestAttemptContent)
            if let userDefaults = UserDefaults(suiteName: "group.com.inteligolife.onesignal") {
                let value1 = userDefaults.string(forKey: "key1")
                let value2 = userDefaults.string(forKey: "key2")
                print("NSE value1 = ", value1?.description ?? "No value")
                print("NSE value2 = ", value2?.description ?? "No value")
                bestAttemptContent.title = value1 ?? "value1 Not Set"
                bestAttemptContent.body = value2 ?? "value2 Not Set"
            }
            contentHandler(bestAttemptContent)
        }
/*
        if let bestAttemptContent = bestAttemptContent {
            OneSignal.didReceiveNotificationExtensionRequest(self.receivedRequest, with: self.bestAttemptContent)
            contentHandler(bestAttemptContent)
        }
*/
    }

    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = contentHandler, let bestAttemptContent =  bestAttemptContent {
            OneSignal.serviceExtensionTimeWillExpireRequest(self.receivedRequest, with: self.bestAttemptContent)
            contentHandler(bestAttemptContent)
        }
    }
    
}
