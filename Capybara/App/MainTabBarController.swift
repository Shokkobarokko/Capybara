import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // First tab
        let homeVC = UIViewController()
        homeVC.view.backgroundColor = .systemBackground
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        let homeNav = UINavigationController(rootViewController: homeVC)

        // Second tab
        let settingsVC = UIViewController()
        settingsVC.view.backgroundColor = .systemBackground
        settingsVC.title = "Settings"
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
        let settingsNav = UINavigationController(rootViewController: settingsVC)

        viewControllers = [homeNav, settingsNav]
    }
}
