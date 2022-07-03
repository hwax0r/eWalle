//
//  MenuViewController.swift
//  eWalle
//
//  Created by David Sergeev on 03/07/2022.
//

import UIKit

final class MenuViewController: UIViewController {
    private let profileView = ProfileView()
    private let menuOptionsView = MenuOptionsView()
    private let dismissButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.imageView?.tintColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(dismissButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Logout", for: .normal)
        guard let customFont = UIFont(name: "AvenirNext-Bold", size: 16) else {
            fatalError("""
                       Failed to load the "AvenirNext-Medium" font.
                       Make sure the font file is included in the project and the font name is spelled correctly.
                       """
            )
        }
        button.titleLabel?.font = customFont
        button.setTitleColor(UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1), for: .normal)
        button.imageView?.tintColor = UIColor(red: 0.106, green: 0.114, blue: 0.157, alpha: 1)
        button.setImage(UIImage(systemName: "power",
                                withConfiguration: UIImage.SymbolConfiguration(textStyle: UIFont.TextStyle.title3)),
                        for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let versionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        guard let customFont = UIFont(name: "AvenirNext-Medium", size: 10) else {
            fatalError("""
                Failed to load the "AvenirNext-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = customFont
        label.textColor = UIColor(red: 0.227, green: 0.259, blue: 0.463, alpha: 1)
        label.text = "Version 2.0.1"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let homeView: UIView
    
    init(homeView: UIView) {
        self.homeView = homeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
}

// MARK: - Private methods
extension MenuViewController {
    private func configureView() {
        view.addSubviews([
            profileView,
            dismissButton,
            menuOptionsView,
//            homeView,
            logoutButton,
            versionLabel,
        ])
        view.backgroundColor = UIColor(red: 0.945, green: 0.953, blue: 0.965, alpha: 1)
        
//        homeView.transform = CGAffineTransform(rotationAngle: 15)
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            dismissButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            dismissButton.widthAnchor.constraint(equalToConstant: 20),
            dismissButton.heightAnchor.constraint(equalToConstant: 20),
            
            menuOptionsView.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 112),
            menuOptionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
//            homeView.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
//            homeView.leadingAnchor.constraint(equalTo: menuOptionsView.trailingAnchor, constant: 46),
//            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            logoutButton.bottomAnchor.constraint(equalTo: versionLabel.topAnchor, constant: -62),
            
            versionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            versionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -27),
        ])
    }
    
    @objc private func dismissButtonAction() {
        self.dismiss(animated: false)
    }
}
