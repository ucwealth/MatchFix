//  Created on 13/05/2023

import UIKit

class LeagueListView: BaseView {
    var tableView = UITableView()
    var dataSource: TableViewDataSource<Table>?
    var table: [Table]? {
        didSet {
            dataSource?.items = table ?? []
            tableView.reloadData()
        }
    }
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(LeagueTableCell.self,
                           forCellReuseIdentifier: MessagesConstant.leagueTableCellID)
        
        dataSource = TableViewDataSource(items: [], identifier: MessagesConstant.leagueTableCellID, cellConfigurator: { table, cell in
            if let leagueTableCell = cell as? LeagueTableCell {
                leagueTableCell.configure(with: table)
            }
        })
        tableView.rowHeight = 44
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
    }
}
