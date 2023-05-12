//  Created on 12/05/2023

import UIKit

class BaseView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Setup
    func setupView() {
        // Override this method in subclasses to perform any additional setup
    }
    
}
