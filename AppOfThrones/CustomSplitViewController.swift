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
        self.loadTwitterSplashAnimation()
        self.Sound()
        self.delegate = self
        self.preferredDisplayMode = .allVisible
    }
    
    let wingsSound = URL(fileURLWithPath: Bundle.main.path(forResource: "SteadyConcertBassDrums", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()

    func Sound() {
        do {
             audioPlayer = try AVAudioPlayer(contentsOf: wingsSound)
             audioPlayer.play()
        } catch {
           // couldn't load file :(
        }
    }
    
    func loadTwitterSplashAnimation() -> Void {
        let splashView = SplashView(iconImage: UIImage(named: "icon_1024")!,iconInitialSize: CGSize(width: 70, height: 70), backgroundColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        
        self.view.addSubview(splashView)
        
        splashView.duration = 2.0
        splashView.animationType = AnimationType.twitter
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
