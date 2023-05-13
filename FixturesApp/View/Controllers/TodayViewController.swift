//  Created on 10/05/2023

import UIKit
import SwiftUI


class TodayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        view = TodayView()
    }

}
//
//// MARK: SwiftUI Preview
//#if DEBUG
//struct TodayViewControllerContainerView: UIViewControllerRepresentable {
//    typealias UIViewControllerType = TodayViewController
//
//    func makeUIViewController(context: Context) -> UIViewControllerType {
//        return TodayViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
//}
//
//struct TodayViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayViewControllerContainerView().colorScheme(.light) // or .dark
//    }
//}
//#endif
