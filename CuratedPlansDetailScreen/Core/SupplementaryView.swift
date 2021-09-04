//
//  SupplementaryView.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import Foundation
import UIKit

protocol SupplementaryView where Self: UICollectionViewCell {
    func setup(with model: SupplementaryViewModel)
}

extension SupplementaryView {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
    
    static func register(with collectionView: UICollectionView, forSupplementaryViewOfKind: String) {
        let nibName = String(describing: self)
        collectionView.register(UINib(nibName: nibName, bundle: nil),
                                forSupplementaryViewOfKind: forSupplementaryViewOfKind,
                                withReuseIdentifier: nibName)        
    }
}
