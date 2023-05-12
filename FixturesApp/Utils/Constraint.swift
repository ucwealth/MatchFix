//  Created on 12/05/2023

import UIKit

class Constraint {
    static func pin(
        _ view: UIView,
        to otherView: UIView,
        withMargin margin: CGFloat = 0,
        andPadding padding: UIEdgeInsets = .zero
    ) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: padding.top + margin),
            view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: padding.left + margin),
            view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: -padding.bottom - margin),
            view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -padding.right - margin)
        ])
    }
    
    static func center(_ view: UIView, in otherView: UIView, withOffset offset: CGPoint = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: otherView.centerXAnchor, constant: offset.x),
            view.centerYAnchor.constraint(equalTo: otherView.centerYAnchor, constant: offset.y)
        ])
    }
    
}

//let redView = UIView()
//redView.backgroundColor = .red
//view.addSubview(redView)
//
//let blueView = UIView()
//blueView.backgroundColor = .blue
//redView.addSubview(blueView)
//
//Constraint.pin(blueView, to: redView, withMargin: 16, andPadding: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))


//class Constraint2 {
//    static func pin(_ view: UIView, to otherView: UIView, withPadding padding: CGFloat = 0) -> [NSLayoutConstraint] {
//        return [
//            view.topAnchor.constraint(equalTo: otherView.topAnchor, constant: padding),
//            view.bottomAnchor.constraint(equalTo: otherView.bottomAnchor, constant: -padding),
//            view.leadingAnchor.constraint(equalTo: otherView.leadingAnchor, constant: padding),
//            view.trailingAnchor.constraint(equalTo: otherView.trailingAnchor, constant: -padding)
//        ]
//    }
//
//    static func center(_ view: UIView, in otherView: UIView, withOffset offset: CGPoint = .zero) -> [NSLayoutConstraint] {
//        return [
//            view.centerXAnchor.constraint(equalTo: otherView.centerXAnchor, constant: offset.x),
//            view.centerYAnchor.constraint(equalTo: otherView.centerYAnchor, constant: offset.y)
//        ]
//    }
//
//    static func align(_ view: UIView, with otherView: UIView, attribute: NSLayoutConstraint.Attribute, offsetBy offset: CGFloat = 0) -> NSLayoutConstraint {
//        return view.value(forKey: attribute.string) as! NSLayoutConstraint
//    }
//}
//
//parentView.addSubview(childView)
//childView.translatesAutoresizingMaskIntoConstraints = false
//NSLayoutConstraint.activate(Constraint.pin(childView, to: parentView, withPadding: 8))
