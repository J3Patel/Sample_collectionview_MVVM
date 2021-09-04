//
//  CellRegistry.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import Foundation

class CellRegistry {
    static func cellType(for model: CollectionViewCellModel) -> CollectionViewCell.Type {
        switch model {
        case is ExcerciseCollectionViewCellModel:
            return ExcerciseCollectionViewCell.self
        case is ExcerciseScheduleDayCollectionViewCellViewModel:
            return ExcerciseScheduleDayCollectionViewCell.self
        case is ExcerciseInformationCollectionViewCellModel:
            return ExcerciseInformationCollectionViewCell.self
        default:
            fatalError("This should'n happen")
        }
        
    }
}


class SupplementaryViewRegistry {
    static func viewType(for model: SupplementaryViewModel) -> SupplementaryView.Type {
        return HeaderCollectionReusableViewCell.self
    }
}
