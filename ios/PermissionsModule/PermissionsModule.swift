import Foundation
import AVFoundation
import Photos
import UserNotifications

@objc(PermissionsModule)
class PermissionsModule: NSObject {

    @objc
    func checkCameraPermission(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        switch status {
        case .authorized:
            resolve(true)
        case .denied, .restricted:
            resolve(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { granted in
                resolve(granted)
            }
        @unknown default:
            reject("UNKNOWN", "Unknown authorization status", nil)
        }
    }

    @objc
    func checkMicrophonePermission(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        switch status {
        case .authorized:
            resolve(true)
        case .denied, .restricted:
            resolve(false)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .audio) { granted in
                resolve(granted)
            }
        @unknown default:
            reject("UNKNOWN", "Unknown authorization status", nil)
        }
    }

    @objc
    func checkNotificationPermission(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional:
                resolve(true)
            case .denied:
                resolve(false)
            case .notDetermined:
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if let error = error {
                        reject("ERROR", "Notification permission error", error)
                    } else {
                        resolve(granted)
                    }
                }
            @unknown default:
                reject("UNKNOWN", "Unknown authorization status", nil)
            }
        }
    }

    @objc
    func checkPhotoPermission(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) {
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            resolve(true)
        case .denied, .restricted:
            resolve(false)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization { status in
                switch status {
                case .authorized:
                    resolve(true)
                default:
                    resolve(false)
                }
            }
        @unknown default:
            reject("UNKNOWN", "Unknown authorization status", nil)
        }
    }
}
