//  Created on 10/05/2023

import UIKit
import SwiftUI

class CompetitionsView: BaseView {
    var tableView = UITableView()
    var comp: [Competition]?
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(CompetitionsListCell.self,
                           forCellReuseIdentifier: MessagesConstant.compViewCellID)
        
        tableView.rowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension CompetitionsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comp?.count ?? 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessagesConstant.compViewCellID, for: indexPath) as! CompetitionsListCell
        if let item = comp?[indexPath.row] {
            cell.configure(with: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sItem = comp?[indexPath.row]
        print("Selected item ", sItem)
        // Get id of selected item
        // Use it to get its details and
        // assign to compDetails
        // push compDetailVC t
        
    }
    
}

class CompetitionsView2: BaseView {
    var tableView = UITableView()
    var dataSource: TableViewDataSource<Competition>?
    var comp: [Competition]?
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(CompetitionsListCell.self,
                           forCellReuseIdentifier: MessagesConstant.compViewCellID)
        
        tableView.rowHeight = 44
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        
        dataSource = TableViewDataSource(items: comp ?? [], identifier: MessagesConstant.compViewCellID, cellConfigurator: { competition, cell in
            if let compCell = cell as? CompetitionsListCell {
                compCell.configure(with: competition)
            }
        })
        
    }
}
