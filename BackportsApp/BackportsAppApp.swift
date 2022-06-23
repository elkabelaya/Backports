//
//  BackportsAppApp.swift
//  BackportsApp
//
//  Created by Elka Belaya on 22.06.2022.
//

import SwiftUI

@main
struct BackportsAppAppWrapper {
    static func main() {
        if #available(iOS 14.0, *) {
            BackportsAppApp.main()
        }
        else {
            UIApplicationMain(CommandLine.argc, CommandLine.unsafeArgv, nil, NSStringFromClass(SceneDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct BackportsAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
