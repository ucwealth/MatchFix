//  Created on 10/05/2023

import UIKit

class CompetitionsViewController: UIViewController, CompetitionsViewModelDelegate {
    
    let competitionView = CompetitionsView()
    let viewModel = CompetitionsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        viewModel.delegate = self 
    }

    override func loadView() {
        view = competitionView
    }
    
    func didUpdateData() {
        DispatchQueue.main.async {[weak self] in
            self?.competitionView.comp = self?.viewModel.competitions
            self?.competitionView.tableView.reloadData()        }
    }
    
}
