//
//  HeaderCollectionReusableViewCell.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import UIKit

class HeaderCollectionReusableViewCellViewModel: SupplementaryViewModel {
    
    let cellModel: [CollectionViewCellModel]
    
    
    init(cellModel: [CollectionViewCellModel]) {
        self.cellModel = cellModel
        
    }
    
    func size(for width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 126)
    }
}

class HeaderCollectionReusableViewCell: UICollectionViewCell, SupplementaryView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionViewDataSourceWrapper = CustomCollectionViewWrapper()
    
    
    func setup(with model: SupplementaryViewModel) {
        guard let headerModel = model as? HeaderCollectionReusableViewCellViewModel else {
            return
        }
        collectionViewDataSourceWrapper.update(with: [headerModel.cellModel])
        collectionView.delegate = collectionViewDataSourceWrapper
        collectionView.dataSource = collectionViewDataSourceWrapper
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        ExcerciseScheduleDayCollectionViewCell.register(with: collectionView)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
    }
    
}
