//
//  CustomSplitViewController.swift
//  AppOfThrones
//
//  Created by Fran González on 21/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit
import AVFoundation

class CustomSplitViewController: UISplitViewController,
                                  UISplitViewControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if DataController.shared.animationPlayed {
            print("Ya hemos ejecutado la animación")
        } else {
            self.loadTwitterSplashAnimation()
            DataController.shared.animationPlayed = true
        }
        
    }

    func loadTwitterSplashAnimation() -> Void {
        let splashView = SplashView(iconImage: UIImage(named: "title")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        
        self.view.addSubview(splashView)
        
        splashView.duration = 1.0
        splashView.animationType = AnimationType.heartBeat
        splashView.iconColor = UIColor.black
        splashView.useCustomIconColor = false
        
        splashView.startAnimation(){
            print("Completed")
        }
        
        // This will deliver the message to stop the heartbeat
        // Need to call like same after the completion of API, means when screen transition needs.
        // Comment and run this, you will see heartbeat will never stops.
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
            print("Heart Attack Stopped")
            splashView.finishHeartBeatAnimation()
        })
    }
    
    func splitViewController(
             _ splitViewController: UISplitViewController,
             collapseSecondary secondaryViewController: UIViewController,
             onto primaryViewController: UIViewController) -> Bool {
        // Return true to prevent UIKit from applying its default behavior
        return true
    }
}
