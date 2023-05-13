//  Created on 13/05/2023
import Foundation

protocol LeagueTableViewModelDelegate: AnyObject {
    func didUpdateData()
}

class LeagueTableViewModel {
    var competitions: [Competition]?
    weak var delegate: CompetitionsViewModelDelegate?
        
    init(competitions: [Competition]? = nil, delegate: CompetitionsViewModelDelegate? = nil) {
        self.competitions = competitions
        self.delegate = delegate
    }
    
    // Fetch Competitions from API Endpoint
    func fetchData() {
        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/competitions/PL/standings") else {
            return
        }
        // add activity indicator
        NetworkService.shared.makeRequest(with: url, responseType: CompetitionsModel.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.competitions = data.competitions
                // reload table
                self?.delegate?.didUpdateData()

            case .failure(let error):
                // Handle the error
                print("CompetitionsViewModel network error", error)
            }
        }
    }
    
}
