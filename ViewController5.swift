//
//  ViewController5.swift
//  AdMobPositionForGitHub
//
//  Created by Guilty on 2018/10/15.
//  Copyright © 2018 GuiltyWorks. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {
    
    var adMobBannerView: GADBannerView!
    
    // ダブルクオーテーションの間に本番用のAdMobIDを挿入
    let adMobBannerID = ""
    // シミュレーション用AdMobID
    let testAdMobBannerID = "ca-app-pub-3940256099942544/2934735716"
    // シミュレーション用AdMobのオンオフ
    let adMobTest: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        adMobBannerView = GADBannerView(adSize: kGADAdSizeBanner)
        
        // シミュレーション用AdMobのオンオフチェック
        if adMobTest {
            adMobBannerView.adUnitID = testAdMobBannerID
        } else {
            adMobBannerView.adUnitID = adMobBannerID
        }
        
        adMobBannerView.rootViewController = self
        adMobBannerView.load(GADRequest())
        
        // 自動的な制約追加を停止
        adMobBannerView.translatesAutoresizingMaskIntoConstraints = false
        
        // AdMobをサブビューとして追加
        view.addSubview(adMobBannerView)
        
        // AdMobに制約を追加
        view.addConstraints(
            [NSLayoutConstraint(item: adMobBannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: adMobBannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ]
        )
    }
}
