//  Created on 10/05/2023

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
   func createNavController(for rootViewController: UIViewController,
                                                     title: String,
                                                     image: UIImage) -> UIViewController {
           let navController = UINavigationController(rootViewController: rootViewController)
           navController.tabBarItem.image = image
           navController.navigationBar.prefersLargeTitles = true
           rootViewController.navigationItem.title = title
           return navController
    }    
    
    func setupVCs() {
          viewControllers = [
            createNavController(for: TodayViewController(),
                                title: MessagesConstant.firstMainTabTitle,
                                image: UIImage(systemName: MessagesConstant.systemballImage)!),
            createNavController(for: CompetitionsViewController(),
                                title: MessagesConstant.secondMainTabTitle,
                                image: UIImage(systemName: "sportscourt")!)
            
          ]
    }

}
