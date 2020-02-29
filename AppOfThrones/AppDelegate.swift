//
//  AppDelegate.swift
//  AppOfThrones
//
//  Created by Fran González on 11/02/2020.
//  Copyright © 2020 Fran González. All rights reserved.
//

import UIKit
import AVFoundation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Mis estados

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.Sound()
        return true
    }

    let concertSound = URL(fileURLWithPath: Bundle.main.path(forResource: "SteadyConcertBassDrums", ofType: "m4a")!)
    var audioPlayer = AVAudioPlayer()
    
    func Sound() {
        do {
             audioPlayer = try AVAudioPlayer(contentsOf: concertSound)
             audioPlayer.play()
        } catch {
           // couldn't load file :(
        }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("Entro en Background")
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

