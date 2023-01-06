//
//  InterstitialView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/06.
//

import GoogleMobileAds
import SwiftUI
import UIKit

class InterstitialAd: NSObject, GADFullScreenContentDelegate {
    var interstitialAd: GADInterstitialAd?
    var unitId: String = "ca-app-pub-6301096399153807/9209160669"
  
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
        }
    }
    
    //Presents the ad if it can, otherwise dismisses so the user's experience is not interrupted
    func showAd() {
        if let ad = interstitialAd, let root = UIApplication.shared.windows.first?.rootViewController {
            ad.present(fromRootViewController: root)
        } else {
            print("Ad not ready")
            self.loadAd()
        }
    }
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        //Prepares another ad for the next time view presented
        self.loadAd()
        print("Ad Closed")
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad Error")
        self.loadAd()
    }
    
}
