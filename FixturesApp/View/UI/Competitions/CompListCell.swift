//  Created on 11/05/2023

import UIKit

class CompetitionsListCell: BaseTableCell {
    let titleLabel = Utility.createLabel()
    
    override func setupViews() {
        contentView.addSubview(titleLabel, anchors: [.leading(10), .centerY(0)])
    }

    func configure(with model: Competition) {
        titleLabel.text = model.name
    }

}
