//  Created on 13/05/2023

import UIKit

class Utility {
    
    static func createLabel(text: String = "Hello",
                            textColor: UIColor = .darkText,
                            fontSize: CGFloat = 16,
                            fontWeight: UIFont.Weight = .semibold,
                            numOfLines: Int = 1,
                            textAlignment: NSTextAlignment = .natural) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = textColor
        label.numberOfLines = numOfLines
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = textAlignment
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
    
    static func createImage(isNamedImage: Bool = false,
                            imagename: String,
                            tintColor: UIColor = .lightGray,
                            imageWidth: CGFloat = 100,
                            imageHeight: CGFloat = 200) -> UIImageView {
        
        let imageView = UIImageView()
        imageView.tintColor = tintColor
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.frame.size.width = imageWidth
        imageView.frame.size.height = imageHeight
        imageView.clipsToBounds = true
        if isNamedImage {
            imageView.image = UIImage(named: imagename)
        } else {
            imageView.image = UIImage(systemName: imagename)
        }
        return imageView
    }
    
    static func createButton(btnBGColor: UIColor = .lightGray,
                             btnTitle: String = "Retry",
                             titleColor: UIColor = .darkGray) -> UIButton {
        let btn = UIButton()
        btn.backgroundColor = btnBGColor
        btn.setTitle(btnTitle, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        return btn
    }
    
    static func extractTime(inputDateStr: String) -> String {
        var dateString = inputDateStr
        var timeString = ""
        dateString = "2023-05-15T19:15:00Z"

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        // Parse the string into a Date object
        if let date = dateFormatter.date(from: dateString) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm"
            
            // Format the date to extract the time
            timeString = timeFormatter.string(from: date)
            print(timeString) // Output: 19:15
        }
        return timeString
    }
    
    static func getCurrentTimeDiff() {
        let dateString = "2023-05-15T19:15:00Z"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) {
            let currentDate = Date()
            
            if date < currentDate {
                print("The given time is in the past")
            } else if date > currentDate {
                print("The given time is in the future")
            } else {
                print("The given time is the current time")
            }
        } else {
            print("Failed to parse the date")
        }

    }
    
    /** TODO
     *
     * Hide bottom tab in other VCs
     * Create custom view for the navbar area
     *  Teams store
     *  Load Images
     *   
     **/
    
}
