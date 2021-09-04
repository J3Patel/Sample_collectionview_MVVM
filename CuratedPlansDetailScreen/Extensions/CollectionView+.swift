//
//  CollectionView+.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 02/09/21.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeueReusableCell(from model: CollectionViewCellModel,
                             with indexPath: IndexPath) -> CollectionViewCell {
        let type = CellRegistry.cellType(for: model)
        let cell = dequeueReusableCell(withReuseIdentifier: type.reuseIdentifier(),
                                   for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    func dequeueReusableSupplementaryView(from model: SupplementaryViewModel,
                                          ofKind kind: String,
                                          indexpath: IndexPath) -> SupplementaryView {
        
        let type = SupplementaryViewRegistry.viewType(for: model)
        return dequeueReusableSupplementaryView(ofKind: kind,
                                                withReuseIdentifier: type.reuseIdentifier(),
                                                for: indexpath) as! SupplementaryView
    }
}

