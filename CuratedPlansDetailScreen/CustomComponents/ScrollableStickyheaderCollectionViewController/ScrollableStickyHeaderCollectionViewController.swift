//
//  ScrollableStickyHeaderCollectionViewController.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 02/09/21.
//

import UIKit

struct ScrollableStickyHeaderCollectionViewSetting {
    let title: String
    let backgroundColor: UIColor
}

protocol ScrollableStickyHeaderCollectionViewControllerDelegate: AnyObject {
    func reloadData()
}

class ScrollableStickyHeaderCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private static let kNumberOfSection: Int = 2
    private unowned var dataSource: ScrollableStickyHeaderCollectionViewControllerDataSource
    let setting: ScrollableStickyHeaderCollectionViewSetting
    
    init(with setting: ScrollableStickyHeaderCollectionViewSetting,
         dataSource: ScrollableStickyHeaderCollectionViewControllerDataSource) {
        self.dataSource = dataSource
        self.setting = setting
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applySetting()
        setupNavigationBar()
        dataSource.registerCell(for: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        // TODO: Color codes will be moved to theming
        self.view.backgroundColor = setting.backgroundColor

        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func applySetting() {
        title = setting.title
        collectionView.backgroundColor = setting.backgroundColor
    }
    
}

extension ScrollableStickyHeaderCollectionViewController: ScrollableStickyHeaderCollectionViewControllerDelegate {
    func reloadData() {
        // TODO: there should be provision of sending indexpath here
        collectionView.performBatchUpdates {
            collectionView.reloadSections(IndexSet(arrayLiteral: 0))
        } completion: { [weak self] _ in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: UICollectionView Delegate

extension ScrollableStickyHeaderCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = dataSource.cellModel(for: indexPath)
        let cell = collectionView.dequeueReusableCell(from: viewModel,
                                                  with: indexPath)
        cell.setup(with: viewModel)
        cell.delegate = dataSource.cellDelegate()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let viewModel = dataSource.cellModelForStickyHeader()
        let view = collectionView.dequeueReusableSupplementaryView(from: viewModel,
                                                                       ofKind: kind,
                                                                       indexpath: indexPath)
        view.setup(with: viewModel)
        return view
    }
        
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return dataSource.cellModelForStickyHeader().size(for: collectionView.bounds.width)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.cellModels(for: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return dataSource.cellModel(for: indexPath).cellSize(for: collectionView.bounds.width)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return ScrollableStickyHeaderCollectionViewController.kNumberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


