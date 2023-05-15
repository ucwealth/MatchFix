//  Created on 12/05/2023

import Foundation

protocol CompetitionsViewModelDelegate: AnyObject {
    func didUpdateData()
}

class CompetitionsViewModel {
    var competitions: [Competition]?
    weak var delegate: CompetitionsViewModelDelegate?
    let realmService = DatabaseService()
        
    init(competitions: [Competition]? = nil,
         delegate: CompetitionsViewModelDelegate? = nil) {
        
        self.competitions = competitions
        self.delegate = delegate
    }
    
//    func fetchData() {
//        let dbData =  realmService.fetch(CompetitionsModelRealm.self)
//        print(dbData.isEmpty)
//        print(dbData)
//        if dbData.isEmpty {
//            fetchDataFromAPI()
//
//        } else {
////            realmService.dropDB()
//
//
//            var competitions = [Competition]()
//            for competitionModel in dbData {
//                for competitionRealm in competitionModel.competitions {
//                    let competition = Competition(id: Int(competitionRealm.id)!, name: competitionRealm.name)
//                    competitions.append(competition)
//                    print(competitions)
//                }
//            }
//            self.competitions = competitions
//            // reload table
//            self.delegate?.didUpdateData()
//        }
//
//    }
    
    
 //   func fetchDataFromAPI() {
    func fetchData() {
        guard let url = URL(string: "\(MessagesConstant.BASE_URL)/competitions") else {
            return
        }
        // add activity indicator
        NetworkService.shared.makeRequest(with: url,
                                          responseType:
                                            CompetitionsModel.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.competitions = data.competitions
                
                DispatchQueue.main.async {
                    
                    // Store in the realm
                    let toSave = CompetitionsModelRealm(data)
                    self?.realmService.create(toSave)
                }
                
                // reload table
                self?.delegate?.didUpdateData()

            case .failure(let error):
                // Handle the error
                print("CompetitionsViewModel network error", error)
            }
        }
    }
    
}
