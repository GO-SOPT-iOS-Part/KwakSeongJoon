import UIKit

import Inject





class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let injectViewController = Inject.ViewControllerHost(MovieFirstViewController())
        let navigationController = UINavigationController(rootViewController: MainViewController())
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = injectViewController
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
