//  Created on 12/05/2023

import Foundation

class CompetitionsViewModel {
    private var competition: Competition?
    
    init(competition: Competition? = nil) {
        self.competition = competition
    }
    
    var title: String {
        return competition?.name ?? ""
    }
    
    // Fetch Competitions from API Endpoint
    
}
