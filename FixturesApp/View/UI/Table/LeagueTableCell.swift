//  Created on 13/05/2023
import UIKit

class LeagueTableCell: BaseTableCell {
    
    override func setupViews() {
        contentView.addSubview(containerStack,
                               anchors: [.leading(15), .trailing(-15), .bottom(10), .top(10)])
    }

    func configure(with model: Table) {
        position.text = String(describing: model.position)
        clubName.text = model.team.name
        won.text = String(describing: model.won)
        lost.text = String(describing: model.lost)
        draw.text = String(describing: model.draw)
//        clubCrest.image = // Use sdwebimage to get this
    }

    // MARK: - Properties
    let position = Utility.createLabel(text: "1", fontSize: 13)
    let clubCrest = Utility.createImage(imagename: MessagesConstant.systemballImage)
    let clubName = Utility.createLabel(fontSize: 17)
    lazy var firstHStack = Utility.createStack(views: [position, clubCrest, clubName], spacing: 10)
    
    let won = Utility.createLabel()
    let draw = Utility.createLabel()
    let lost = Utility.createLabel()
    lazy var secondHStack = Utility.createStack(views: [won, draw, lost], spacing: 10)
    
    lazy var containerStack = Utility.createStack(
        views: [firstHStack, secondHStack], alignment: .leading , distribution: .equalSpacing )

}
