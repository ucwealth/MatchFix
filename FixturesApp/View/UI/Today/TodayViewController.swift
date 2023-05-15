//  Created on 10/05/2023

import UIKit

class TodayViewController: UIViewController, TodayViewModelDelegate {
    let viewModel = TodayViewModel()
    let todayView = TodayView()
    
    override func loadView() {
        view = todayView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchData()
    }
    
    func didUpdateData() {
        DispatchQueue.main.async {[weak self] in
            self?.todayView.tableView.reloadData()
            self?.todayView.todayList = self?.viewModel.todayList
        }

    }

}
