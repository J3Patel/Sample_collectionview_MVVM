//
//  CustomCollectionViewWrapper.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import Foundation
import UIKit

protocol CustomCollectionViewWrapperDelegate: AnyObject {
    var collectionview: UICollectionView! { get }
}

class CustomCollectionViewWrapper: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    private var cellModels: [[CollectionViewCellModel]]
    private weak var cellDelegate: CollectionViewCellDelegate?
    weak var delegate: CustomCollectionViewWrapperDelegate?
    
    init(cellModels: [[CollectionViewCellModel]] = [], cellDelegate: CollectionViewCellDelegate? = nil) {
        self.cellModels = cellModels
        self.cellDelegate = cellDelegate
    }
    
    func update(with cellModels: [[CollectionViewCellModel]]) {
        self.cellModels = cellModels
        delegate?.collectionview.reloadData()
    }
    
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = cellModels[indexPath.section][indexPath.item]
        let cell = collectionView.dequeueReusableCell(from: viewModel,
                                                  with: indexPath)
        cell.setup(with: viewModel)
        cell.delegate = cellDelegate
        return cell
    }

    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellModels[section].count
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellModels[indexPath.section][indexPath.item].cellSize(for: collectionView.bounds.width)
    }
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return cellModels.count
    }
}
