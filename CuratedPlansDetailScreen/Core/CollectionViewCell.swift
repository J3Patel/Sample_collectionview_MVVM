//
//  CollectionViewCell.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 02/09/21.
//

import UIKit

protocol CollectionViewCellDelegate: AnyObject {
    
}

protocol CollectionViewCell where Self: UICollectionViewCell {
    var delegate: CollectionViewCellDelegate? { set get }
    func setup(with model: CollectionViewCellModel)
}

extension CollectionViewCell {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
    
    static func register(with collectionView: UICollectionView) {
        let nibName = String(describing: self)
        collectionView.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
}

