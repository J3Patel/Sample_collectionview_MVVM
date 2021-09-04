//
//  ViewController.swift
//  CuratedPlansDetailScreen
//
//  Created by Jatin on 02/09/21.
//

import UIKit

class ViewController: UIViewController {
    let viewModel = ScrollableStickyHeaderViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let setting = ScrollableStickyHeaderCollectionViewSetting(title: "15 day plan for Your Knees - Phase 1",
                                                                  backgroundColor: UIColor(named: "EBD4D9")!)
        let controller = ScrollableStickyHeaderCollectionViewController(with: setting, dataSource: viewModel)
        viewModel.set(delegate: controller)
        self.navigationController?.pushViewController(controller,
                                                      animated: true)
        
    }

}

