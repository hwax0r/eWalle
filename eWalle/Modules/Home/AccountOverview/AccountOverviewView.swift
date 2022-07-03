//
//  AccountOverviewView.swift
//  eWalle
//
//  Created by David Sergeev on 01/07/2022.
//

import UIKit

final class AccountOverviewView: UIView, IHaveViewModel {
    typealias ViewModel = AccountOverviewViewModel
    var viewModel: ViewModel? {
        didSet {
            guard viewModel != oldValue else {
                return
            }
            viewModelChanged()
        }
    }
    
    private let sectionNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 16) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.text = "Account Overview"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let accountCardView = AccountCardView()
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension AccountOverviewView {
    private func configureView() {
        addSubviews([
            sectionNameLabel,
            accountCardView,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sectionNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            sectionNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            sectionNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            accountCardView.topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 20),
            accountCardView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            accountCardView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            accountCardView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}

// MARK: - IHaveViewModel
extension AccountOverviewView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        accountCardView.viewModel = viewModel.accountCardViewModel
        setNeedsLayout()
    }
}
