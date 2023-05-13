//  Created on 13/05/2023

import UIKit
import SwiftUI

class LeagueListView: BaseView, CompetitionsViewModelDelegate {
    var tableView = UITableView()
    var viewModel = LeagueTableViewModel()
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(LeagueTableCell.self,
                           forCellReuseIdentifier: MessagesConstant.leagueTableCellID)
        
        tableView.rowHeight = 44
        viewModel.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.fetchData()
        didUpdateData()
    }
    
    func didUpdateData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension LeagueListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessagesConstant.leagueTableCellID, for: indexPath) as! LeagueTableCell
//        if let item = viewModel.competitions?[indexPath.row] {
//            cell.configure(with: item)
//        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let sItem = viewModel.competitions?[indexPath.row]
//        print("Selected item ", sItem)
    }
    
}
