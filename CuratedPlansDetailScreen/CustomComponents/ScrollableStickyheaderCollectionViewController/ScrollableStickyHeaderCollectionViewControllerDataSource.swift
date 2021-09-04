//
//  ScrollableStickyHeaderCollectionViewControllerDataSource.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import Foundation
import UIKit

protocol ScrollableStickyHeaderCollectionViewControllerDataSource: AnyObject {
    func cellModelForTopNavigationView() -> CollectionViewCellModel
    func cellModelForStickyHeader() -> SupplementaryViewModel
    func contentCellModels() -> [CollectionViewCellModel]
    func registerCell(for collectionView: UICollectionView)
    func cellDelegate() -> CollectionViewCellDelegate
}

extension ScrollableStickyHeaderCollectionViewControllerDataSource {
    func cellModel(for indexPath: IndexPath) -> CollectionViewCellModel {
        if indexPath.section == 0 {
            return cellModelForTopNavigationView()
        } else {
            return contentCellModels()[indexPath.item]
        }
    }
    
    func cellModels(for section: Int) -> [CollectionViewCellModel] {
        if section == 0 {
            return [cellModelForTopNavigationView()]
        } else {
            return contentCellModels()
        }
    }
}
