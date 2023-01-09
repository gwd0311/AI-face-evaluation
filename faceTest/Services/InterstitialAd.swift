//
//  InterstitialView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/06.
//

import Foundation
import GoogleMobileAds
import SwiftUI
import UIKit

// test: ca-app-pub-3940256099942544/4411468910
// oper: ca-app-pub-6301096399153807/9209160669

class InterstitialAd: NSObject, GADFullScreenContentDelegate, ObservableObject {
    
    var interstitialAd: GADInterstitialAd?
    var unitId: String = "ca-app-pub-6301096399153807/9209160669"
    
    @Published var isDismiss: Bool = false
    @Published var isLoaded: Bool = false
  
    override init() {
        super.init()
        loadAd()
    }
    
    func loadAd() {
        let req = GADRequest()
        req.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        GADInterstitialAd.load(withAdUnitID: unitId, request: req) { [self] interstitialAd, err in
            if let err = err {
                print("Failed to load ad with error: \(err)")
            }

            self.interstitialAd = interstitialAd
            self.interstitialAd?.fullScreenContentDelegate = self
            isLoaded = true
            isDismiss = false
        }
    }
    
    // 가능한 경우 광고를 표시하고, 그렇지 않으면 사용자 경험이 중단되지 않도록 닫습니다.
    func showAd() {
        if let ad = interstitialAd, let root = UIApplication.topViewController() {
            ad.present(fromRootViewController: root)
        } else {
            print("Ad not ready")
            self.loadAd()
            isLoaded = false
        }
    }
    
    // 광고 다보고 X버튼 누르면 뭐할지 정하는 곳
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        // 다음에 표시되는 보기를 위해 다른 광고를 준비합니다.
        self.loadAd()
        
        print("Ad Did Closed")

        UIApplication.topViewController()?.dismiss(animated: true)
    }
    
    func adWillDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        isDismiss.toggle()
        print("AD Will Closed")
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad Error")
        print(error.localizedDescription)
        self.loadAd()
    }
    
}
