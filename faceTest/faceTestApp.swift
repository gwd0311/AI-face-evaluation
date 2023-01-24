//
//  faceTestApp.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/02.
//

import SwiftUI
import AppTrackingTransparency
import GoogleMobileAds
import AdSupport

@main
struct faceTestApp: App {
    
    @StateObject private var model: Evaluation
    
    private func delay() async {
        try? await Task.sleep(nanoseconds: 0_500_000_000)
    }
    
    func requestPermission() {
        Task {
            await delay()
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .notDetermined:
                    print("notDetermined")
                case .restricted:
                    print("Restricted")
                case .denied:
                    print("Denied")
                case .authorized:
                    print("Authroized")
//                    print(ASIdentifierManager.shared().advertisingIdentifier)
                @unknown default:
                    print("Unknown")
                }
            }
        }
    }
    
    init() {
        _model = StateObject(wrappedValue: Evaluation())

        if ATTrackingManager.trackingAuthorizationStatus == .notDetermined {
            // 사용자가 앱 추적에 대한 선택을 표시하지 않았습니다.
            // 데이터를 수집하는 이유를 설명하는 팝업을 표시할 수 있습니다.
            // 여기에서 이를 수행할 변수를 전환합니다.
            requestPermission()
        } else {
            ATTrackingManager.requestTrackingAuthorization { status in
                //Whether or not user has opted in initialize GADMobileAds here it will handle the rest
                print(ASIdentifierManager.shared().advertisingIdentifier.uuidString)
                GADMobileAds.sharedInstance().start()
            }
        }
    }
    

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .environmentObject(model.languageManager)
                .environmentObject(model.interstitalAd)
        }
    }
}
