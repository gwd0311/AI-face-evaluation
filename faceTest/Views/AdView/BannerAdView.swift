//
//  BannerView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/06.
//

import SwiftUI
import GoogleMobileAds

// test: ca-app-pub-3940256099942544/2934735716
// oper: ca-app-pub-6301096399153807/8177497632

struct BannerAdView: UIViewControllerRepresentable {
    let adUnitID: String

    init(adUnitID: String = "ca-app-pub-6301096399153807/8177497632") {
        self.adUnitID = adUnitID
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let vc = BannerViewController()
        vc.adUnitID = adUnitID
        return vc
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
}

final class BannerViewController: UIViewController {

    var adUnitID: String? {
        get { bannerView.adUnitID }
        set { bannerView.adUnitID = newValue }
    }

    private var bannerView = GADBannerView(adSize: GADAdSizeBanner)

    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.delegate = self
        bannerView.rootViewController = self
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)

        NSLayoutConstraint.activate([
            bannerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bannerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])

        bannerView.load(GADRequest())
    }
}

extension BannerViewController: GADBannerViewDelegate {
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
}
