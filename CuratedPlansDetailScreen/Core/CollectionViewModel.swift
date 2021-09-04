//
//  CollectionViewCellModel.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 02/09/21.
//

import Foundation
import UIKit

protocol CollectionViewCellModel {
    func cellSize(for width: CGFloat) -> CGSize
}
