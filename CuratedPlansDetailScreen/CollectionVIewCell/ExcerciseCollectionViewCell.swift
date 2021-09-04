//
//  ExcerciseCollectionViewCell.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 02/09/21.
//

import UIKit

class ExcerciseCollectionViewCell: UICollectionViewCell, CollectionViewCell {
   
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    weak var delegate: CollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = false
        containerView.addShadow(shadowColor:UIColor.lightGray.cgColor,
                                        shadowOffset: CGSize(width: 0, height: 5),
                                        shadowOpacity: 0.5,
                                        shadowRadius: 8)
    }
    
    func setup(with model: CollectionViewCellModel) {
        guard let viewModel = model as? ExcerciseCollectionViewCellModel else {
            return
        }
        testLabel.text = viewModel.text
    }
}

class ExcerciseCollectionViewCellModel: CollectionViewCellModel {
    private let post: Datum
    
    var text: String {
        post.text
    }
    init(post: Datum) {
        self.post = post
    }
    
    func cellSize(for width: CGFloat) -> CGSize {
        return CGSize(width: width, height: 364)
    }
    
}
