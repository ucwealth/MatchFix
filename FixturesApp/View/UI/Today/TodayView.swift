//  Created on 10/05/2023

import UIKit

class TodayView: BaseView {

    var tableView = UITableView()
    var dataSource: TableViewDataSource<Match>?
    var todayList: [Match]? {
        didSet {
            dataSource?.items = todayList ?? []
            tableView.reloadData()
        }
    }
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(TodayListCell.self,
                           forCellReuseIdentifier: MessagesConstant.todayCellID)

        dataSource = TableViewDataSource(items: [],
                                         identifier: MessagesConstant.todayCellID,
                                         cellConfigurator: { match, cell in
            if let todayCell = cell as? TodayListCell {
                todayCell.configure(with: match)
            }
        })
        
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.rowHeight = 100
        
    }

}
