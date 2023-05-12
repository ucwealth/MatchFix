//  Created on 10/05/2023

import UIKit
import SwiftUI

class CompetitionsViewController: UIViewController {

    var compView = CompetitionsView()
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(compView)
    }
    
    override func loadView() {
        view = compView
    }
    

}

// MARK: SwiftUI Preview
#if DEBUG
struct CompetitionsViewControllerContainerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CompetitionsViewController

    func makeUIViewController(context: Context) -> UIViewControllerType {
        return CompetitionsViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct ContentViewController_Previews: PreviewProvider {
    static var previews: some View {
        CompetitionsViewControllerContainerView().colorScheme(.light) // or .dark
    }
}
#endif
