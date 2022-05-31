//
//  ViewController.swift
//  tdd_example
//
//  Created by 최민한 on 2022/06/01.
//

import UIKit


final class ViewController: UIViewController {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupLayout()
        view.backgroundColor = .black
    }
    
}

// MARK: Layout

extension ViewController {
    private func setupLayout() {
        
    }
}

