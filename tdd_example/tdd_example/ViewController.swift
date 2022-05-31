import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {

  let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
    $0.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 50)
    $0.minimumLineSpacing = 20
    $0.sectionInset = .init(top: 10, left: 0, bottom: 0, right: 10)
  }

  lazy var collectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: collectionViewFlowLayout
  ).then {
    $0.backgroundColor = .black
    $0.dataSource = self
    $0.delegate = self
    $0.register(Cell.self, forCellWithReuseIdentifier: "cell")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupLayout()
  }
  
  
}

// MARK: Layout

extension ViewController {
  private func setupLayout() {
    view.addSubview(collectionView)
    collectionView.snp.makeConstraints { make in
      make.top.bottom.equalTo(view.safeAreaLayoutGuide)
      make.leading.trailing.equalToSuperview()
    }
  }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
    cell.titleLabel.text = "\(indexPath.row)"
    return cell
  }
  
}
