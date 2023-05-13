//  Created on 13/05/2023

import UIKit

class Utility {
    
    static func createLabel(text: String = "Hello",
                            textColor: UIColor = .darkText,
                            fontSize: CGFloat = 16,
                            fontWeight: UIFont.Weight = .semibold) -> UILabel {
        let label = UILabel()
        label.text = text
        label.backgroundColor = .green
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        return label
    }
    
    static func createStack(views: [UIView],
                            axis: NSLayoutConstraint.Axis = .horizontal,
                            alignment: UIStackView.Alignment = .fill,
                            distribution: UIStackView.Distribution = .fill,
                            spacing: CGFloat = 0) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = axis
        stack.alignment = alignment
        stack.distribution = distribution
        stack.spacing = spacing
        return stack
    }
    
}
