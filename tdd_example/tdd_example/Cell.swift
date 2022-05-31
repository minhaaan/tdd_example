//
//  Cell.swift
//  tdd_example
//
//  Created by 최민한 on 2022/06/01.
//

import UIKit

final class Cell: UICollectionViewCell {
  
  // MARK: Properties
  
  let titleLabel = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 20)
    $0.textColor = .black
  }
  
  // MARK: init
    
  override init(frame: CGRect) {
    super.init(frame: .zero)
    
    setupLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError()
  }
  
  // MARK: Method
  
  private func setupLayout() {
    backgroundColor = .white
    
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
  
  
  
}
