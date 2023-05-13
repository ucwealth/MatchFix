//  Created on 10/05/2023

import UIKit
import SwiftUI

class TodayView: BaseView {

    var tableView = UITableView()
    var dataSource: TableViewDataSource<TodayViewModel>?
    var viewModelArr = [TodayViewModel]()
//    var viewModelArr = [
//        TodayViewModel(today: Match(id: 1, status: "13:00")),
//        TodayViewModel(today: Match(id: 1, status: "16:00")),
//        TodayViewModel(today: Match(id: 1, status: "18:30")),
//        TodayViewModel(today: Match(id: 1, status: "20:45"))
//    ]
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(TodayListCell.self,
                           forCellReuseIdentifier: MessagesConstant.todayCellID)

        dataSource = TableViewDataSource(items: viewModelArr,
                                         identifier: MessagesConstant.todayCellID,
                                         cellConfigurator: { viewModel, cell in
            if let todayCell = cell as? TodayListCell {
                todayCell.configure(with: viewModel)
            }
        }, didSelectRow: { viewModel in
            // Push next VC onto the nav stack
            
            print("Selected: \(viewModel.status)")
        })
        
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.rowHeight = 80
        
    }

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
