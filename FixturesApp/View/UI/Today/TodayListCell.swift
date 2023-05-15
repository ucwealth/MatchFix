//  Created on 13/05/2023

import UIKit

class TodayListCell: BaseTableCell {
    
    // MARK: - Setup Views
    override func setupViews() {
//        firstVStack.backgroundColor = .systemTeal
        contentView.addSubview(containerStack, anchors: [.leading(15), .trailing(-15), .centerY(0)])
    }

    // MARK: - Public API
    
    func configure(with model: Match) {
        status.text = model.status
        matchDay.text = "MD: \(model.matchday)"
        firstTeam.text = model.homeTeam.name
        secondTeam.text = model.awayTeam.name
        startTime.text = Utility.extractTime(inputDateStr: model.utcDate)
        
        let homeScore = model.score.fullTime.home
        let awayScore = model.score.fullTime.away
        firstTeamScore.text =  (homeScore == nil) ? String(0) : "\(String(describing: homeScore))"
        secondTeamScore.text = (awayScore == nil) ? String(0) : "\(String(describing: awayScore))"
        currentMatchTime.text = "00'  "
       // currentMatchTime.text = // Calculate time passed btw start time and now
        
    }

    // MARK: - Properties
    let status = Utility.createLabel(text: "TIMED", fontSize: 13)
    let startTime = Utility.createLabel(fontSize: 20)
    let matchDay = Utility.createLabel(text: "MD: 39", textColor: .gray, fontSize: 10)
    
    let firstTeam = Utility.createLabel(text: "Parma FC")
    var firstTeamScore = Utility.createLabel(text: "0")
    
    var currentMatchTime = Utility.createLabel(text: "45'  ", textColor: .gray, fontSize: 10, textAlignment: NSTextAlignment.right)

    let secondTeam = Utility.createLabel(text: "Real Madrid CF")
    var secondTeamScore = Utility.createLabel(text: "0")
    
//    lazy var firstHStack = Utility.createStack(views: [firstTeam, firstTeamScore], spacing: 15)
    lazy var firstHStack = Utility.createStack(views: [firstTeam, firstTeamScore], distribution: UIStackView.Distribution.equalSpacing)
    lazy var midHStack = Utility.createStack(views: [currentMatchTime], distribution: UIStackView.Distribution.fill)
    lazy var SecondHStack = Utility.createStack(views: [secondTeam, secondTeamScore], distribution: UIStackView.Distribution.equalSpacing)
    
    lazy var firstVStack = Utility.createStack(views: [status, startTime, matchDay], axis: .vertical, alignment: .leading, distribution: .fillEqually, spacing: 3)
    lazy var secondVStack = Utility.createStack(views: [firstHStack, midHStack, SecondHStack], axis: .vertical, alignment: .fill, distribution: .equalSpacing , spacing: 10)

    lazy var containerStack = Utility.createStack(views: [firstVStack, secondVStack], alignment: .leading , distribution: .fillProportionally )

}
