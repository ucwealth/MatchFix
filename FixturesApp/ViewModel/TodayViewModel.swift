//  Created on 13/05/2023

import Foundation

protocol TodayViewModelDelegate: AnyObject {
    func didUpdateData()
}

class TodayViewModel {
    var todayList = [Match]()
    weak var delegate: TodayViewModelDelegate?

    func fetchData() {

        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/matches?date=TODAY") else {
            return
        }
        // add activity indicator
        NetworkService.shared.makeRequest(with: url, responseType: TodayMatch.self) {[weak self] result in
            switch result {
            case .success(let data):
                // Do something with the data
//                print("TodayViewModel network data", data)
                self?.todayList = data.matches
                
                // reload Table
                self?.delegate?.didUpdateData()
            case .failure(let error):
                // Handle the error
                print("TodayViewModel network error", error)
            }
        }
    }
    
}
