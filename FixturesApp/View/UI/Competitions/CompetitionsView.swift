//  Created on 10/05/2023

import UIKit
import SwiftUI

class CompetitionsView: BaseView, CompetitionsViewModelDelegate {
    var tableView = UITableView()
    var viewModel = CompetitionsViewModel()
    
    override func setupView() {
        addSubview(tableView, anchors: [.leading(0), .trailing(0), .bottom(0), .top(0)])
        tableView.register(CompetitionsListCell.self,
                           forCellReuseIdentifier: MessagesConstant.compViewCellID)
        
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

extension CompetitionsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.competitions?.count ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessagesConstant.compViewCellID, for: indexPath) as! CompetitionsListCell
        if let item = viewModel.competitions?[indexPath.row] {
            cell.configure(with: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sItem = viewModel.competitions?[indexPath.row]
        print("Selected item ", sItem)
        // push compDetailVC t
    }
    
}
