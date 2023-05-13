//  Created on 10/05/2023

import UIKit

class CompetitionsViewController: UIViewController {
    let viewModel = CompetitionsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        viewModel.fetchData()
    }

    override func loadView() {
        view = CompetitionsView()
    }
    
}
