//
//  ExcerciseScheduleDayCollectionViewCell.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import UIKit

class ExcerciseScheduleDayCollectionViewCell: UICollectionViewCell, CollectionViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dayContainerView: UIView!
    var delegate: CollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        dayContainerView.layer.borderColor = UIColor.blue.cgColor
    }
    
    func setup(with model: CollectionViewCellModel) {
        guard let viewModel = model as? ExcerciseScheduleDayCollectionViewCellViewModel else {
            return
        }
        dayLabel.text = String(viewModel.day)
    }

}


class ExcerciseScheduleDayCollectionViewCellViewModel: CollectionViewCellModel {
    let day: Int
    
    init(day: Int) {
        self.day = day
    }
    
    func cellSize(for width: CGFloat) -> CGSize {
        CGSize(width: 48, height: 62)
    }
    
}
