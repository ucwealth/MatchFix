//  Created on 10/05/2023

import UIKit
import RealmSwift

class CompetitionsViewController: UIViewController,
                                    CompetitionsViewModelDelegate,
                                    CompetitionsViewDelegate {

    let competitionView = CompetitionsView()
    let viewModel = CompetitionsViewModel()
    var dataResults: Results<CompetitionsModelRealm>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        viewModel.delegate = self
        competitionView.delegate = self 
    }

    override func loadView() {
        view = competitionView
    }
    
    func didUpdateData() {
        DispatchQueue.main.async {[weak self] in
            self?.competitionView.comp = self?.viewModel.competitions
            self?.competitionView.tableView.reloadData()
            
        }
    }
    
    func didSelectRowItem(_ competition: Competition) {
        // get id of this competition
        let tabbar = CompDetailTabBarController()
//        tabbar.competitionID = competition.id
        print("Comp ID in compVC ", competition.id)
        navigationController?.pushViewController(tabbar, animated: true)
    }
    
}
