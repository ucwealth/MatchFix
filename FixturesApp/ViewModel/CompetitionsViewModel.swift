//  Created on 12/05/2023

import Foundation

protocol CompetitionsViewModelDelegate: AnyObject {
    func didUpdateData()
}

class CompetitionsViewModel {
    var competitions: [Competition]?
    let service = NetworkService()
    weak var delegate: CompetitionsViewModelDelegate?
        
    init(competitions: [Competition]? = nil, delegate: CompetitionsViewModelDelegate? = nil) {
        self.competitions = competitions
        self.delegate = delegate
    }
    
    // Fetch Competitions from API Endpoint
    func fetchData() {
        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/competitions") else {
            return
        }
        // add activity indicator
        service.makeRequest(with: url, responseType: CompetitionsModel.self) { [weak self] result in
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
