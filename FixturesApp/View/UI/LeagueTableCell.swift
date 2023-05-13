//  Created on 13/05/2023
import UIKit
import SwiftUI

class LeagueTableCell: BaseTableCell {
    
    override func setupViews() {
        contentView.addSubview(containerStack, anchors: [.leading(15), .trailing(-15), .bottom(10), .top(10)])
    }

    func configure(with viewModel: LeagueTableViewModel) {
//        startTime.text = viewModel.status
    }

    // MARK: - Properties
    let position = Utility.createLabel(text: "1", fontSize: 13)
    let clubCrest: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "ball"))
        imageView.tintColor = .lightGray
        return imageView
    }()
    let clubName = Utility.createLabel(fontSize: 17)
    lazy var firstHStack = Utility.createStack(views: [position, clubCrest, clubName], spacing: 10)
    
    let won = Utility.createLabel()
    let draw = Utility.createLabel()
    let lost = Utility.createLabel()
    lazy var secondHStack = Utility.createStack(views: [won, draw, lost], spacing: 10)
    
    lazy var containerStack = Utility.createStack(views: [firstHStack, secondHStack], alignment: .leading , distribution: .equalSpacing )

}


//#if DEBUG
//struct TodayViewContainer: UIViewRepresentable {
//    typealias UIViewType = TodayView
//
//    func makeUIView(context: Context) -> UIViewType {
//        return TodayView(frame: .zero)
//    }
//
//    func updateUIView(_ uiView: TodayView, context: Context) {}
//}
//
//struct TodayView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayViewContainer().preferredColorScheme(.light)
//    }
//}
//#endif
