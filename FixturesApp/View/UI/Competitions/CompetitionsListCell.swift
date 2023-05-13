//  Created on 11/05/2023

import UIKit

class CompetitionsListCell: BaseTableCell {

    // MARK: - Properties

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .darkText
        return label
    }()
    
    let disclosureIndicator: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.tintColor = .lightGray
        return imageView
    }()
        
    // MARK: - Setup Views
    
    override func setupViews() {
        contentView.addSubview(titleLabel, anchors: [.leading(10), .centerY(0)])
        contentView.addSubview(disclosureIndicator, anchors: [.trailing(-15), .centerY(0)])
    }

    // MARK: - Public API
    
    func configure(with model: Competition) {
        
        titleLabel.text = model.name
    }
    
}
