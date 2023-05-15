//  Created on 13/05/2023

import UIKit

class BaseTableCell: UITableViewCell {
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError(MessagesConstant.requiredInitMsg)
    }

    func setupViews() {}
    
}
