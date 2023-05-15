//  Created on 13/05/2023

import UIKit

class FixturesVC: UIViewController {
    let fixturesView = FixturesView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(fixturesView,
                        anchors: [.centerX(0), .centerY(20)])
    }

}

class FixturesView: BaseView {
    override func setupView() {
        retryBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        addSubview(containerView,
                   anchors: [.centerX(0)])
    }

    let ballImage = Utility.createImage(imagename: MessagesConstant.systemballImage, imageHeight: 200)
    let noFixturesLabel = Utility.createLabel(
        text: "No Fixtures", fontSize: 13, textAlignment: NSTextAlignment.center )
    let retryBtn = Utility.createButton(btnBGColor: #colorLiteral(red: 0.9254902005, green: 0.9254902005, blue: 0.9254902005, alpha: 1))

    lazy var containerView = Utility.createStack(
        views: [ballImage, noFixturesLabel, retryBtn],
        axis: .vertical, spacing: 20)
    
}
