//
//  AccountCardView.swift
//  eWalle
//
//  Created by David Sergeev on 01/07/2022.
//

import UIKit

final class AccountCardView: UIView, IHaveViewModel {
    typealias ViewModel = AccountCardViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let balanceView = BalanceView()
    private let someActionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 0.675, blue: 0.188, alpha: 1)
        button.tintColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        button.layer.cornerRadius = 48 / 2
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "plus")!, for: .normal)
        button.contentMode = .scaleAspectFit
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
extension AccountCardView {
    private func configureView() {
        addSubviews([
            balanceView,
            someActionButton,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 12
        layer.masksToBounds = true
        backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1)
        
        NSLayoutConstraint.activate([
            balanceView.topAnchor.constraint(equalTo: self.topAnchor, constant: 26),
            balanceView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            balanceView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -26),
            
            someActionButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 34),
            someActionButton.widthAnchor.constraint(equalToConstant: 48),
            someActionButton.heightAnchor.constraint(equalToConstant: 48),
            someActionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            someActionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -34),
        ])
    }
}

// MARK: - IHaveViewModel
extension AccountCardView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        balanceView.viewModel = viewModel.balanceModel
        setNeedsLayout()
    }
}
