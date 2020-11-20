import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        window = UIWindow()
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .yellow
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        return true
    }
}
