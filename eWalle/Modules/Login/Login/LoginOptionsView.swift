//
//  LoginOptionsView.swift
//  eWalle
//
//  Created by David Sergeev on 01/07/2022.
//

import UIKit

final class LoginOptionsView: UIView {
    private let signInButton: UIButton = {
        let button = UIButton()
        guard let customFont = UIFont(name: "AvenirNext-DemiBold", size: 16) else {
            fatalError("""
                Failed to load the "AvenirNext-DemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        button.titleLabel?.font = customFont
        button.setTitle("Sign in →", for: .normal)
        button.setTitleColor(UIColor(red: 0.129, green: 0.137, blue: 0.188, alpha: 1), for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.675, blue: 0.188, alpha: 1)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let createAccountButton: UIButton = {
        let button = UIButton()
        guard let customFont = UIFont(name: "AvenirNext-Regular", size: 16) else {
            fatalError("""
                Failed to load the "AvenirNext-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        button.titleLabel?.font = customFont
        button.setTitle("Create an account", for: .normal)
        button.setTitleColor(UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1), for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(createAccountButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var signInButtonPressed: (() -> Void)?
    var createAccountButtonPressed: (() -> Void)?
    
    init() {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Private methods
extension LoginOptionsView {
    private func configureView() {
        addSubviews([
            signInButton,
            createAccountButton,
        ])
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: self.topAnchor),
            signInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            signInButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 29),
            createAccountButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 28),
            createAccountButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28),
            createAccountButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc private func signInButtonAction() {
        signInButtonPressed?()
    }
    
    @objc private func createAccountButtonAction() {
        createAccountButtonPressed?()
    }
}
