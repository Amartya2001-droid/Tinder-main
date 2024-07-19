//
//
//  HeartSync
//
//  Created by Amartya Karmakar on 02/05/24
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct HeartSync: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var userManager = UserManager(service: UserService())
    @StateObject var authmanager = AuthManager(service: AuthService())
    @StateObject var matchManager = MatchManager(service: MatchService())
    
    var body: some Scene {
        WindowGroup {

            WelcomeView()
                .environmentObject(userManager)
                .environmentObject(authmanager)
                .environmentObject(matchManager)
        }
    }
}
