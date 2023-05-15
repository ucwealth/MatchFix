//  Created on 14/05/2023

import Foundation

protocol TeamsViewModelDelegate: AnyObject {
    func didUpdateSquadData()
}

class TeamsViewModel {
    var teamSquad: [Squad]?
    weak var delegate: TeamsViewModelDelegate?
    var teamsList = [Team]()
    let tableViewModel = LeagueTableViewModel()
    
    // Use the teams from standing/table to populate here
    // Only make network call when a collection view cell is clicked
    func fetchTeams() {
        teamsList = [
            Team(id: 1, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 2, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 3, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 4, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 5, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 6, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 7, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 8, name: "Manchester United", crest: MessagesConstant.systemballImage),
            Team(id: 9, name: "Manchester United", crest: MessagesConstant.systemballImage),

        ]
        // get from db

    }
    
    func fetchSquad(teamID: Int) {
        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/teams/\(teamID)") else {
            return
        }
        print(url)
        NetworkService.shared.makeRequest(with: url,
                                          responseType:
                                            TeamSquad.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.teamSquad = data.squad
                print("teamSquad", self?.teamSquad)
                // reload table
                self?.delegate?.didUpdateSquadData()

            case .failure(let error):
                print("CompetitionsViewModel network error", error)
            }
        }
    }
    
}
