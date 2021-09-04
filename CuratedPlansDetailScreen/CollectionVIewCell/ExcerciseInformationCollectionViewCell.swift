//
//  ExcerciseInformationCollectionViewCell.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import UIKit

protocol ExcerciseInformationCollectionViewCellDelegate: CollectionViewCellDelegate {
    func dataUpdated()
}

class ExcerciseInformationCollectionViewCell: UICollectionViewCell, CollectionViewCell {
    var delegate: CollectionViewCellDelegate?
    var viewModel: ExcerciseInformationCollectionViewCellModel?
    @IBOutlet weak var excerciseInformationLabel: UILabel!
    
    func setup(with model: CollectionViewCellModel) {
        guard let excerciseModel = model as? ExcerciseInformationCollectionViewCellModel else {
            return
        }
        viewModel = excerciseModel
        excerciseInformationLabel.text = excerciseModel.excerciseInformationText
    }
    
    @IBAction func readMoreTapped(_ sender: Any) {
        viewModel?.toggleCollapse()
        (delegate as? ExcerciseInformationCollectionViewCellDelegate)?.dataUpdated()
    }

}

class ExcerciseInformationCollectionViewCellModel: CollectionViewCellModel {
    
    var isCollapsed = true
    var excerciseInformationText: String {
        if isCollapsed {
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque congue, quam quis tincidunt aliquam, risus mi eleifend leo, et convallis risus eros id leo. Vivamus lobortis iaculis enim. Nunc rutrum erat et justo pretium, vel condimentum nulla vestibulum. Nullam porta dui quis orci pretium, quis ultricies odio laoreet. Vivamus vitae sagittis diam, quis congue nisl. Proin velit libero, luctus ac commodo nec, hendrerit ut nunc. Pellentesque molestie elementum neque eu finibus."
        } else {
            return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque congue, quam quis tincidunt aliquam, risus mi eleifend leo, et convallis risus eros id leo. Vivamus lobortis iaculis enim. Nunc rutrum erat et justo pretium, vel condimentum nulla vestibulum. Nullam porta dui quis orci pretium, quis ultricies odio laoreet. Vivamus vitae sagittis diam, quis congue nisl. Proin velit libero, luctus ac commodo nec, hendrerit ut nunc. Pellentesque molestie elementum neque eu finibus.orci molestie eu. Morbi accumsan ullamcorper rutrum. Pellentesque posuere eget nibh eu faucibus. Integer mattis sodales eros, vel sollicitudin orci. Sed porta, urna sed interdum venenatis, nibh tortor eleifend erat, finibus fermentum risus magna sed erat. Curabitur vitae purus velit. Fusce porta massa non orci porta, ac interdum justo pulvinar. Etiam imperdiet rhoncus odio at posuere. Proin nec velit non dolor placerat facilisis at at leo. Donec id nunc ac neque viverra dictum ut ut ernon orci porta, ac interdum justo pulvinar. Etiam imperdiet rhoncus odio at posuere. Proin nec velit non dolor placerat facilisis at at leo. Donec id nunc ac neque viverra dictum ut ut erat. Donec fringilla ac libero ac vestibulum. Sed imperdiet massa vitae ullamcorper finibus. Pellentesque porttitor, sapien eleifend placerat imperdiet, metus magna venenatis ipsum, id lobortis neque nisl non justo."
        }
    }
    
    func toggleCollapse() {
        isCollapsed = !isCollapsed
    }
    
    func cellSize(for width: CGFloat) -> CGSize {
        
        // cell calculation will be done with theming optins instead of calculating by nreating NIB
        let cell = Bundle.main.loadNibNamed(ExcerciseInformationCollectionViewCell.reuseIdentifier(),
                                            owner: nil,
                                            options: nil)![0] as! ExcerciseInformationCollectionViewCell
        cell.setup(with: self)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let targetSize = CGSize(width: width, height: 0)
        let newSize = cell.contentView.systemLayoutSizeFitting(targetSize,
                                                               withHorizontalFittingPriority: .required,
                                                               verticalFittingPriority: .fittingSizeLevel)
                
        return newSize//CGSize(width: width, height: 300)
    }
    
    
    
}
