//  Created on 13/05/2023

import Foundation

class TodayViewModel {
    private var today: Match?
    let service = NetworkService()
    
    var status: String {
        return today?.minute ?? "00:00"
    }
    
    init(today: Match? = nil) {
        self.today = today
    }
        
    func fetchData() {
        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/matches") else {
            return
        }
        service.makeRequest(with: url, responseType: TodayMatch.self) { result in
            switch result {
            case .success(let data):
                // Do something with the data
                print("TodayViewModel network data", data)
            case .failure(let error):
                // Handle the error
                print("TodayViewModel network error", error)
            }
        }
    }
    
}
