//
//  ScrollableStickyHeaderViewModel.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 03/09/21.
//

import Foundation
import UIKit

class ScrollableStickyHeaderViewModel {
    
    // All these data will be fetched from API service
    
    var cellModels = [CollectionViewCellModel]()
    // these are empty data as for now
    let excerciseInformationViewModel = ExcerciseInformationCollectionViewCellModel()
    let stickeyheaderCollectionViewModel: HeaderCollectionReusableViewCellViewModel
    weak var delegate: ScrollableStickyHeaderCollectionViewControllerDelegate?
    
    init() {
        // following data will also
        var daysModel = [CollectionViewCellModel]()
        for i in 1...20 {
            daysModel.append(ExcerciseScheduleDayCollectionViewCellViewModel(day: i))
        }
        stickeyheaderCollectionViewModel = HeaderCollectionReusableViewCellViewModel(cellModel: daysModel)
        fetchExcerciseDetail()
    }
    
    func fetchExcerciseDetail() {
        
        // these things will be moved to network service and error handling is not done
        
        guard let url = URL(string: "https://dummyapi.io/data/v1/post?limit=10") else {
            return
        }

        var request = URLRequest(url: url)
        
        request.allHTTPHeaderFields = ["app-id":"6133832d91bf20db50373822"]
        request.httpMethod = "GET"
        
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] (data, response, error) in
            if let data = data {
                guard let userPostsData = try? JSONDecoder().decode(UserPostsDataModel.self, from: data) else {
                    return
                }
                DispatchQueue.main.async {
                    self?.parseDataModels(userPostsData: userPostsData)
                }
            }
        })

        task.resume()
    }
    
    func parseDataModels(userPostsData: UserPostsDataModel) {
        cellModels = userPostsData.data.map{ ExcerciseCollectionViewCellModel(post: $0) }
        delegate?.reloadData()
    }
    
    func set(delegate: ScrollableStickyHeaderCollectionViewControllerDelegate) {
        self.delegate = delegate
    }
}


extension ScrollableStickyHeaderViewModel: ScrollableStickyHeaderCollectionViewControllerDataSource {
    func cellDelegate() -> CollectionViewCellDelegate {
        self
    }
    
    func registerCell(for collectionView: UICollectionView) {
        ExcerciseInformationCollectionViewCell.register(with: collectionView)
        ExcerciseCollectionViewCell.register(with: collectionView)
        HeaderCollectionReusableViewCell.register(with: collectionView,
                                              forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader)
    }
    
    func cellModelForTopNavigationView() -> CollectionViewCellModel {
        excerciseInformationViewModel
    }
    
    func cellModelForStickyHeader() -> SupplementaryViewModel {
        stickeyheaderCollectionViewModel
    }
    
    func contentCellModels() -> [CollectionViewCellModel] {
        cellModels
    }
}

extension ScrollableStickyHeaderViewModel: ExcerciseInformationCollectionViewCellDelegate {
    func dataUpdated() {
        delegate?.reloadData()
    }
    
}
