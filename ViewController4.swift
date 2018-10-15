//
//  ViewController4.swift
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
        
        // AdMobの座標を決定
        adMobBannerView.frame.origin = CGPoint(x: (view.frame.size.width - adMobBannerView.frame.size.width - UIApplication.shared.keyWindow!.safeAreaInsets.left - UIApplication.shared.keyWindow!.safeAreaInsets.right) / 2, y: view.frame.size.height - adMobBannerView.frame.height - UIApplication.shared.keyWindow!.safeAreaInsets.bottom)
        // これ↓は書かずに省略できます。もちろん、見やすくするために書いても構いません。動作は同じはずですので。
        // adMobBannerView.frame.size = CGSize(adMobBannerView.frame.width, adMobBannerView.frame.height)
        
        // シミュレーション用AdMobのオンオフチェック
        if adMobTest {
            adMobBannerView.adUnitID = testAdMobBannerID
        } else {
            adMobBannerView.adUnitID = adMobBannerID
        }
        
        adMobBannerView.rootViewController = self
        adMobBannerView.load(GADRequest())
        
        // AdMobをサブビューとして追加
        view.addSubview(adMobBannerView)
    }
}
