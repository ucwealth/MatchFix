//  Created on 13/05/2023

import UIKit

class TableVC: UIViewController,
               LeagueTableViewModelDelegate {
    
    let lView = LeagueListView()
    let viewModel = LeagueTableViewModel()
    var compID = 0
    
    override func loadView() {
        view = lView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData(competitionID: compID)
        viewModel.delegate = self
    }

    func didUpdateData() {
        DispatchQueue.main.async {[weak self] in
            self?.lView.table = self?.viewModel.table
            self?.lView.tableView.reloadData()
            
        }
    }
    
}
