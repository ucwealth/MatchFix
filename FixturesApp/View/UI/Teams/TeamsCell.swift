//  Created on 14/05/2023

import UIKit

class TeamsViewCell: UICollectionViewCell {
    let crest = Utility.createImage(imagename: "snowflake.circle", imageWidth: 100, imageHeight: 100)
    let teamName = Utility.createLabel(numOfLines: 0, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError(MessagesConstant.requiredInitMsg)
    }

    func setupViews() {
        let containerView = Utility.createStack(
            views: [crest, teamName],
            axis: .vertical, alignment: .center,
            distribution: .fillProportionally)

        contentView.addSubview(containerView,
                               anchors: [.centerY(0),
                                         .leading(0), .trailing(0), .top(0)])
    }
    
    func configure(with model: Team) {
        // use sdwebimage to get and cache image
        crest.image = UIImage(systemName: model.crest)
        teamName.text = model.name
    }
    
}
