//  Created on 13/05/2023

import UIKit
import SwiftUI

class TodayListCell: BaseTableCell {
    
    // MARK: - Setup Views
    override func setupViews() {
//        secondVStack.backgroundColor = .red
        firstVStack.backgroundColor = .blue
        
        contentView.addSubview(containerStack, anchors: [.leading(15), .trailing(-15), .bottom(10), .top(10)])

//        contentView.addSubview(disclosureIndicator, anchors: [.trailing(-15), .centerY(0)])
    }

    // MARK: - Public API
    func configure(with viewModel: TodayViewModel) {
        startTime.text = viewModel.status
    }

    // MARK: - Properties
    let timed = Utility.createLabel(text: "TIMED", fontSize: 13)
    let startTime = Utility.createLabel(fontSize: 20)
    let matchCategory = Utility.createLabel(text: "MD: 39", textColor: .gray, fontSize: 10)
    lazy var firstVStack = Utility.createStack(views: [timed, startTime, matchCategory], axis: .vertical, alignment: .leading, distribution: .fillEqually, spacing: 3)
    
    let firstTeam = Utility.createLabel(text: "Parma FC")
    var firstTeamScore = Utility.createLabel(text: "0")
    lazy var firstHStack = Utility.createStack(views: [firstTeam, firstTeamScore], spacing: 10)
    
    var currentMatchTime = Utility.createLabel(text: "45'", textColor: .gray, fontSize: 10)
    
    let secondTeam = Utility.createLabel(text: "Real Madrid CF")
    var secondTeamScore = Utility.createLabel(text: "0")
    lazy var SecondHStack = Utility.createStack(views: [secondTeam, secondTeamScore])
    
    lazy var secondVStack = Utility.createStack(views: [firstHStack, currentMatchTime, SecondHStack], axis: .vertical, spacing: 10)

    lazy var containerStack = Utility.createStack(views: [firstVStack, secondVStack], alignment: .leading , distribution: .fillProportionally )

//    let disclosureIndicator: UIImageView = {
//        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
//        imageView.tintColor = .lightGray
//        return imageView
//    }()

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



//#if DEBUG
//struct TodayListCellContainer: UIViewRepresentable {
//    typealias UIViewType = TodayListCell
//
//    func makeUIView(context: Context) -> UIViewType {
//        return TodayListCell(frame: .zero)
//    }
//
//    func updateUIView(_ uiView: TodayListCell, context: Context) {}
//}
//
//struct TodayListCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TodayListCellContainer().preferredColorScheme(.light)
//    }
//}
//#endif
