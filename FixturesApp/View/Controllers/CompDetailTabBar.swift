//  Created on 13/05/2023

import UIKit

class CompDetailTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        var competitionID = UserDefaults.standard.value(forKey: "competitionID") as! Int

        // Add view controllers to the tab bar
        let firstVC = TableVC()
        firstVC.compID = competitionID
        print("firstvc compid ", firstVC.compID )
        firstVC.tabBarItem = UITabBarItem(title: "Table", image: nil, selectedImage: nil)

        let secondVC = FixturesVC()
        secondVC.tabBarItem = UITabBarItem(title: "Fixtures", image: nil, selectedImage: nil)

        let thirdVC = TeamsVC()
        thirdVC.tabBarItem = UITabBarItem(title: "Teams", image: nil, selectedImage: nil)

        self.viewControllers = [firstVC, secondVC, thirdVC]
    }
    
    
    override func viewDidLayoutSubviews() {
        tabBar.frame = CGRect(x: 0,y: 100, width: UIScreen.main.bounds.width,height: 70)

    }

}









class BottomVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        CustomTopTab().completion = {[weak self] in
            print("pppppp")
            self?.present(FixturesVC(), animated: false)
        }
        
    }
    
}

class CustomTopTab: UIViewController {
    let topTab = UIView()
    let bottomView = UIView()
    let bottomVC = BottomVC()

    let first = Utility.createButton(btnBGColor: .white, btnTitle: "Table", titleColor: .darkGray)
    let second = Utility.createButton(btnBGColor: .white, btnTitle: "Fixtures", titleColor: .darkGray)
    let third = Utility.createButton(btnBGColor: .white, btnTitle: "Teams", titleColor: .darkGray)
    lazy var hStack = Utility.createStack(views: [first, second, third], alignment: .center, distribution: .fillEqually)
    
    var completion: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let btnList = [first, second, third]
        btnList.forEach {
            $0.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
            $0.widthAnchor.constraint(equalToConstant: view.frame.size.width/3).isActive = true
        }

        first.tag = 1
        second.tag = 2
        third.tag = 3
        
        
        topTab.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: 150)
        topTab.backgroundColor = .white
        
        topTab.addSubview(hStack, anchors: [.leading(0), .top(0), .trailing(0), .bottom(0)])
        
        bottomView.frame = CGRect(x: 0, y: topTab.frame.size.height+30, width: view.frame.size.width, height: view.frame.size.height - topTab.frame.size.height)
        
        [topTab, bottomView].forEach { view.addSubview($0) }
                
        self.addChild(bottomVC)
        bottomView.addSubview(bottomVC.view, anchors: [.leading(0), .top(0), .bottom(0), .trailing(0) ])
        bottomVC.didMove(toParent: self)
        
    }
    
    @objc func didTapBtn(_ sender: UIButton) {
        let selectedVC: UIViewController?
        if sender.tag == 1 {
            selectedVC = TableVC()
            bottomVC.present(selectedVC!, animated: false)
        } else if sender.tag == 2 {
            selectedVC = FixturesVC()
            selectedVC?.modalPresentationStyle = .formSheet
            bottomVC.present(selectedVC!, animated: false)
//            completion?()
        } else {
            selectedVC = TeamsVC()
            bottomVC.present(selectedVC!, animated: false)
        }

    }
    
}
