//
//  UIView+.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 04/09/21.
//

import Foundation
import UIKit

extension UIView {
    public func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                    shadowOffset: CGSize = CGSize(width: 0.5, height: 0.5),
                    shadowOpacity: Float = 0.4,
                    shadowRadius: CGFloat = 2.0) {
         layer.shadowColor = shadowColor
         layer.shadowOffset = shadowOffset
         layer.shadowOpacity = shadowOpacity
         layer.shadowRadius = shadowRadius
    }
}
