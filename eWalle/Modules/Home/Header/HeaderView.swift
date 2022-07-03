//
//  HeaderView.swift
//  eWalle
//
//  Created by David Sergeev on 01/07/2022.
//

import UIKit

final class HeaderView: UIView {
    private let logoView = LogoView()
    private let applicationNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textAlignment = .center
        guard let customFont = UIFont(name: "Ubuntu-Medium", size: 28) else {
            fatalError("""
                Failed to load the "Ubuntu-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        label.text = "eWalle"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let menuButton: UIButton = {
        let button = UIButton()
        
        var buttonConfiguration = UIButton.Configuration.plain()
        buttonConfiguration.image = UIImage(systemName: "person.crop.circle")
        buttonConfiguration.imagePadding = 0
        buttonConfiguration.imagePlacement = .all
        button.configuration = buttonConfiguration
        button.addTarget(self, action: #selector(menuButtonAction), for: .touchUpInside)
        button.tintColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    var menuButtonPressed: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension HeaderView {
    private func configureView() {
        addSubviews([
            logoView,
            applicationNameLabel,
            menuButton,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        let logoViewHeight: Double = 31
        let logoViewWidth: Double = logoViewHeight * 1.5
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.topAnchor),
            logoView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            logoView.heightAnchor.constraint(equalToConstant: logoViewHeight),
            logoView.widthAnchor.constraint(equalToConstant: logoViewWidth),
            logoView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            applicationNameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            applicationNameLabel.leadingAnchor.constraint(equalTo: logoView.trailingAnchor, constant: 10),
            applicationNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            menuButton.topAnchor.constraint(equalTo: self.topAnchor),
            menuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            menuButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc private func menuButtonAction() {
        menuButtonPressed?()
    }
}
