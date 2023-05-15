//  Created on 13/05/2023

import UIKit

class TeamsVC: UIViewController,
                TeamsViewDelegate {

    let teamsView = TeamsView()
    let viewmodel = TeamsViewModel()

    override func loadView() {
        view = teamsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamsView.delegate = self
        viewmodel.fetchTeams()
        teamsView.teamList = viewmodel.teamsList
    }
    
    func didSelectGridItem(_ team: Team) {
        viewmodel.fetchSquad(teamID: team.id)
        
        let detailVC = TeamsViewDetailViewController()
        if let sheet = detailVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
        }
        present(detailVC, animated: true)
    }
    
}
