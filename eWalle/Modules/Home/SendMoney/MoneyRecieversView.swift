//
//  MoneyRecieversView.swift
//  eWalle
//
//  Created by David Sergeev on 02/07/2022.
//

import UIKit

class MoneyRecieversView: UIView, IHaveViewModel {
    typealias ViewModel = MoneyRecieversViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private lazy var moneyRecieversCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 120)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MoneyRecieverCell.self, forCellWithReuseIdentifier: MoneyRecieverCell.reuseIdentifier)
        collectionView.register(AddNewRecieverCell.self, forCellWithReuseIdentifier: AddNewRecieverCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension MoneyRecieversView {
    private func configureView() {
        addSubviews([
            moneyRecieversCollectionView,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            moneyRecieversCollectionView.topAnchor.constraint(equalTo: self.topAnchor),
            moneyRecieversCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            moneyRecieversCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            moneyRecieversCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension MoneyRecieversView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let viewModel = viewModel else {
            return 1
        }
        
        return viewModel.moneyRecievers.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row != 0 else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddNewRecieverCell.identifier, for: indexPath)
            guard let cell = cell as? AddNewRecieverCell else {
                fatalError("cell as? AddNewRecieverCell")
            }
            return cell
        }
        guard let viewModel = viewModel else {
            fatalError("MoneyRecieversView UICollectionViewDataSource data count != viewModel.count")
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoneyRecieverCell.reuseIdentifier, for: indexPath)
        guard let cell = cell as? MoneyRecieverCell else {
            fatalError("cell as? MoneyRecieverCell")
        }
        print(viewModel.moneyRecievers)
        cell.viewModel = viewModel.moneyRecievers[indexPath.row - 1]
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension MoneyRecieversView: UICollectionViewDelegate {
    
}

// MARK: - IHaveViewModel
extension MoneyRecieversView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        moneyRecieversCollectionView.reloadData()
        setNeedsLayout()
    }
}
