//
//  BalanceView.swift
//  eWalle
//
//  Created by David Sergeev on 01/07/2022.
//

import UIKit

class BalanceView: UIView, IHaveViewModel {
    typealias ViewModel = BalanceViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let balanceValueLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.09, green: 0.094, blue: 0.133, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 24) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let balanceTextLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-Regular", size: 12) else {
            fatalError("""
                Failed to load the "AvenirNext-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.text = "Current balance"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
extension BalanceView {
    private func configureView() {
        addSubviews([
            balanceValueLabel,
            balanceTextLabel,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            balanceValueLabel.topAnchor.constraint(equalTo: self.topAnchor),
            balanceValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            balanceValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            balanceTextLabel.topAnchor.constraint(equalTo: balanceValueLabel.bottomAnchor, constant: 8),
            balanceTextLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            balanceTextLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            balanceTextLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: - IHaveViewModel
extension BalanceView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        balanceValueLabel.text = viewModel.balance
        setNeedsLayout()
    }
}
