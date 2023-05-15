//  Created on 13/05/2023
import Foundation

protocol LeagueTableViewModelDelegate: AnyObject {
    func didUpdateData()
}

class LeagueTableViewModel {
    var table: [Table]?
    weak var delegate: LeagueTableViewModelDelegate?
    var teams = [Team]()
        
    init(table: [Table]? = nil, delegate: LeagueTableViewModelDelegate? = nil) {
        self.table = table
        self.delegate = delegate
    }
    
    func fetchData(competitionID: Int) {
        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/competitions/\(competitionID)/standings") else {
            return
        }
        // add activity indicator
        NetworkService.shared.makeRequest(with: url, responseType: LeagueTableModel.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.table = data.standings[0].table
                for tabl in data.standings[0].table {
                    self?.teams.append(tabl.team)
                }
//                UserDefaults.standard.set(self?.teams, forKey: "teams")
                // move to realm
                self?.delegate?.didUpdateData()

            case .failure(let error):
                print("LeagueTableViewModel network error", error)
            }
        }
    }
    
}
