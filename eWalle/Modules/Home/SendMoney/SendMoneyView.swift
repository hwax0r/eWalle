//
//  SendMoneyView.swift
//  eWalle
//
//  Created by David Sergeev on 02/07/2022.
//

import UIKit

final class SendMoneyView: UIView, IHaveViewModel {
    typealias ViewModel = SendMoneyViewModel
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
        label.text = "Send money"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let scanQRButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.tintColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        button.layer.cornerRadius = 52 / 2
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "qrcode.viewfinder")!, for: .normal)
        button.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let moneyRecieversView = MoneyRecieversView()
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension SendMoneyView {
    private func configureView() {
        addSubviews([
            sectionNameLabel,
            scanQRButton,
            moneyRecieversView,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            sectionNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            sectionNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            scanQRButton.topAnchor.constraint(equalTo: self.topAnchor),
            scanQRButton.widthAnchor.constraint(equalToConstant: 48),
            scanQRButton.heightAnchor.constraint(equalToConstant: 48),
            scanQRButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scanQRButton.bottomAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor),
            
            moneyRecieversView.topAnchor.constraint(equalTo: sectionNameLabel.bottomAnchor, constant: 20),
            moneyRecieversView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            moneyRecieversView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            moneyRecieversView.bottomAnchor.constraint(greaterThanOrEqualTo: moneyRecieversView.topAnchor, constant: 140),
        ])
    }
}

// MARK: - IHaveViewModel
extension SendMoneyView {
    func viewModelChanged() {
        guard let viewModel = viewModel else { return }
        moneyRecieversView.viewModel = viewModel.moneyRecieversModel
        setNeedsLayout()
    }
}
